#!/usr/bin/env zsh

# Clone a plugin, identify its init file, source it, and add it to your fpath.
# Taken from https://github.com/mattmc3/zsh_unplugged
plugin-load() {
  local repo plugdir initfile initfiles=()
  : ${ZPLUGINDIR:=${ZDOTDIR:-~/.config/zsh}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules \
        https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (( $#initfiles )) || { echo >&2 "No init file '$repo'." && continue }
      ln -sf $initfiles[1] $initfile
    fi
    fpath+=$plugdir
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}

# ath - change Alacritty theme
ath() {
    ALACRITTY_SCHEMES_FILE=~/.config/alacritty/color-schemes.yml

    local input=$1
    local schemes=$(yq 'sort_keys(.schemes) | .schemes.[] | key' $ALACRITTY_SCHEMES_FILE)

    # If no input, or input isn't an available scheme, then show the list of schemes for selection
    if [[ -z $input ]] || ! (echo $schemes | grep -qFx ${input}); then
        scheme=$(echo $schemes | fzf --header='Select Alacritty theme: ')
    else
        scheme=$input
    fi

    # Update colors in color scheme file to alias of selected scheme anchor
    yq -i '.colors alias = "'${scheme}'"' $ALACRITTY_SCHEMES_FILE
}

# gig - generate .gitignore
gig() {
    selections=$(curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/list \
    | tr "," "\n" \
    | gum filter --prompt "Select gitignore(s)> " --placeholder "Type to filter options. Use tab to pick multiple, enter when done." --no-limit \
    | tr "\n" ","  \
    | sed 's/,$/\n/')

    if [[ -z "${selections}" ]]; then
        echo "No selections made. Exiting."
        return 1
    fi

    outfile=""
    gum confirm "Append to .gitignore or just output?" --affirmative="Append" --negative "Output" && outfile=".gitignore"
    curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/"${selections}" | tee -a $outfile
}

# switchdesktop - switch desktops in OSX
switchdesktop() {
    typeset -A desktophash
    desktophash[0]=29
    desktophash[1]=18
    desktophash[2]=19
    desktophash[3]=20
    desktophash[4]=21
    desktophash[5]=23
    desktophash[6]=22
    desktophash[7]=26
    desktophash[8]=28
    desktophash[9]=25
    desktopkey=${desktophash[$1]}
    osascript -e "tell application \"System Events\" to key code $desktopkey using option down"
}

# tm - start or attach to tmux session
tm() {
    if [[ $# -eq 1 ]]; then
        sesh=$1
    else
        # List tmux sessions, including preview of windows in each session
        # Select session or F9 to kill selected session
        sesh=$(tmux ls \
        | fzf --delimiter=: --preview='tmux list-windows -t {1}' \
            --bind='f9:execute(tmux kill-session -t {1})' \
            --bind='f9:+reload(tmux ls)' \
            --prompt='Select session or F9 to kill: ' \
        | cut -d: -f1)
    fi

    if [[ -z $sesh ]]; then
        echo "No session selected"
        return 1 
    fi

    # If we're not inside tmux, start and/or attach to the session
    if [[ -z $TMUX ]]; then
        tmux new-session -As $sesh
        return 0
    fi

    # If we are inside tmux, create a new detatched session (if needed)
    if ! tmux has-session -t $sesh; then
        tmux new-session -ds $sesh
    fi

    # Switch to the detatched (or previously existing) session
    tmux switch-client -t $sesh
}

# help - use bat to display help text
help() {
    "$@" --help 2>&1 | bat --plain --language=help
}

# kp: [K]ill [P]rocess
# show output of "ps -ef", use [tab] to select one or multiple entries
# press [enter] to kill selected processes and go back to the process list.
# or press [escape] to go back to the process list. Press [escape] twice to exit completely.
kp() {
    local pid=$(ps -ef | sed 1d | eval "fzf -m --header='[kill:process]'" | awk '{print $2}')

    if [ "x$pid" != "x" ]
    then
    echo $pid | xargs kill -${1:-9}
    kp
    fi
}

# pods - Function for fzf to list k8s pods and provide keybindings for viewing logs or exec into pod
pods() {
    FZF_DEFAULT_COMMAND="kubectl get pods --all-namespaces" \
        fzf --info=inline --layout=reverse --header-lines=1 \
        --prompt "$(kubectl config current-context | sed 's/-context$//')> " \
        --header $'╱ Enter (kubectl exec -it) ╱ CTRL-O (open log in editor) ╱ CTRL-R (reload) ╱ CTRL_U (change view)\n\n' \
        --bind 'ctrl-u:change-preview-window(80%,border-bottom|hidden|)' \
        --bind 'enter:execute:kubectl exec -it --namespace {1} {2} -- bash > /dev/tty' \
        --bind 'ctrl-o:execute:kubectl logs --all-containers --namespace {1} {2} | ${EDITOR} -' \
        --bind 'ctrl-r:reload(eval "$FZF_DEFAULT_COMMAND")' \
        --preview-window up:follow \
        --preview 'kubectl logs --follow --all-containers --tail=10000 --namespace {1} {2}' "$@"
}

# solidify - replace a symlink with a copy of the file/folder it points to
solidify() {
    local target=$(readlink $1)
    if [[ -z $target ]]; then
        echo "Not a symlink"
        return 1
    fi
    rm -fv $1
    cp -afv $target $1 || {
        # on failure, restore the symlink
        rm -rfv "$1"
        ln -sfv "$target" "$1"
    }
}

# suggest_gclone - if the input buffer is a github URL, replace it with a git clone command
function suggest_gclone() {
    local url="$BUFFER"
    if [[ "$url" =~ ^https://github\.com/[^/]+/[^/]+ ]]; then
        local repo=${url#https://github.com/}
        repo=${repo%%/*} # Extract only the username part
        local nextSegment=${url#https://github.com/$repo/}
        local repoName=${nextSegment%%/*} # Extract the repo name
        BUFFER="git clone git@github.com:${repo}/${repoName}.git"
        zle redisplay
    else
        zle self-insert
    fi
}

zle -N suggest_gclone
bindkey '^G' suggest_gclone