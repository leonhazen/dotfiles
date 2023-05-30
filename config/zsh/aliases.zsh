# ls/exa aliases
if [ -x "$(command -v exa)" ]; then
    alias ls="exa --group-directories-first --classify"
    alias ll="exa --group-directories-first --classify --icons --header --git --long"
    alias la="exa --group-directories-first --classify --icons --header --git --long --all"
    alias lt="exa --group-directories-first --icons --tree"
    alias lta="exa --group-directories-first --icons --tree --all"
fi

# directory aliases
alias d='dirs -v'
for index in {1..9}; do
    alias "$index"="cd +${index}"
    unset index
done

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias dot='cd ~/.dotfiles'

alias zs='source $XDG_CONFIG_HOME/zsh/.zshrc'

alias _='sudo'
alias ffs='sudo !!'

alias pbc='pbcopy'
alias df='df -kh'
alias du='du -kh'

alias ag="alias | grep "
alias t="htop"
alias tl="tail -f ${1} | bat --paging=never -l log"

alias nv="nvim"

alias myip="curl https://ip.le.onl -s | jq '.ip' | tr -d '\"'"

# terraform aliases
if [ -x "$(command -v terraform)" ]; then
    alias tf="terraform"
    alias tfp="terraform plan"
    alias tfi="terraform init"
    alias tfd="terraform destroy"
    alias tfa="terraform apply"
    alias tfv="terraform validate"

    alias tfw="terraform workspace"
    alias tfws="terraform workspace select"
    alias tfwl="terraform workspace list"
    alias tfwp="terraform workspace new"
    alias tfwd="terraform workspace delete"
fi

# git
alias g="git"
alias gs="git status"
alias ga="git add"
alias gp="git push"
alias gpo="git push origin"
alias gpl="git pull"
alias gb="git branch"
alias gl="git log"
alias glg="git log --graph --oneline --decorate --all"
alias glo="git log --oneline --decorate --all"
alias gll="git log --graph --oneline --decorate --all --stat"
alias gd="git diff"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gc="git clone"

# suffix alias to allow you to just paste a repo link and it will clone it
alias -s git="git clone --depth 1"

# git commit helper (requires gum)
# calls /utils/git-commit.sh
if [ -x "$(command -v gum)" ]; then
    alias gcm="git-commit.sh"
fi

# lazygit
if [ -x "$(command -v lazygit)" ]; then
    alias lg="lazygit"
fi

# alias code to code-insiders if it exists and USE_VSCODE_INSIDERS is set to 1
if [ -x "$(command -v code-insiders)" ] && [ "$USE_VSCODE_INSIDERS" = "1" ]; then
    alias code="code-insiders"
fi

# kubernetes
alias k="kubectl"
alias kg="kubectl get"
alias kga="kubectl get --all-namespaces"
alias kgp="kubectl get pods"
alias kgs="kubectl get services"
alias kgn="kubectl get nodes"
alias kgd="kubectl get deployments"
alias kgj="kubectl get jobs"
alias kd="kubectl describe"
alias kdp="kubectl describe pod"
alias kdn="kubectl describe node"
alias kdd="kubectl describe deployment"
alias kds="kubectl describe service"
alias kdj="kubectl describe job"
alias krm="kubectl delete"
alias kl="kubectl logs"
alias klf="kubectl logs -f"
alias keit="kubectl exec -it"
alias kaf="kubectl apply -f"
alias kctx="kubectx"
alias kns="kubens"

# aws profile picker
alias awsp="source _aws_profile_picker"
