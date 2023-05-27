### ~/.zshenv ###
# This file is sourced by all instances of Zsh, unless the -f option is set.
# This should only be used for exporting environment variables.
# Because we are setting ZDOTDIR here, the next file to be sourced will be
# $HOME/.config/zsh/.zprofile

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export DOTFILES="$HOME/.dotfiles"

export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
export HISTDUP=erase                    # Erase duplicates in history file
export HISTCONTROL=ignoreboth           # Ignore duplicates and commands starting with space


if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='moar'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

export LS_COLORS="*~=0;38;2;58;60;78:bd=1;38;2;241;250;140;48;2;40;42;54:ca=0:cd=1;38;2;241;250;140;48;2;40;42;54:di=0;38;2;189;147;249:do=1;38;2;255;121;198;48;2;40;42;54:ex=0;38;2;80;250;123:fi=0;38;2;248;248;242:ln=0;38;2;139;233;253:mh=0:mi=0;38;2;255;85;85;48;2;40;42;54:no=0;38;2;248;248;242:or=1;38;2;255;85;85;48;2;40;42;54:ow=0;38;2;189;147;249;48;2;80;250;123:pi=0;38;2;241;250;140;48;2;40;42;54:rs=0;38;2;255;184;108:sg=0;38;2;40;42;54;48;2;241;250;140:so=1;38;2;255;121;198;48;2;40;42;54:st=0;38;2;248;248;242;48;2;189;147;249:su=0;38;2;248;248;242;48;2;255;85;85:tw=0;38;2;40;42;54;48;2;80;250;123:*.a=0;38;2;80;250;123:*.c=0;38;2;255;184;108:*.d=0;38;2;255;184;108:*.h=0;38;2;255;184;108:*.m=0;38;2;255;184;108:*.o=0;38;2;58;60;78:*.p=0;38;2;255;184;108:*.r=0;38;2;255;184;108:*.t=0;38;2;255;184;108:*.z=1;38;2;255;85;85:*.7z=1;38;2;255;85;85:*.as=0;38;2;255;184;108:*.bc=0;38;2;58;60;78:*.bz=1;38;2;255;85;85:*.cc=0;38;2;255;184;108:*.cp=0;38;2;255;184;108:*.cr=0;38;2;255;184;108:*.cs=0;38;2;255;184;108:*.di=0;38;2;255;184;108:*.el=0;38;2;255;184;108:*.ex=0;38;2;255;184;108:*.fs=0;38;2;255;184;108:*.go=0;38;2;255;184;108:*.gv=0;38;2;255;184;108:*.gz=1;38;2;255;85;85:*.hh=0;38;2;255;184;108:*.hi=0;38;2;58;60;78:*.hs=0;38;2;255;184;108:*.jl=0;38;2;255;184;108:*.js=0;38;2;255;184;108:*.ko=0;38;2;80;250;123:*.kt=0;38;2;255;184;108:*.la=0;38;2;58;60;78:*.ll=0;38;2;255;184;108:*.lo=0;38;2;58;60;78:*.md=0;38;2;255;184;108:*.ml=0;38;2;255;184;108:*.mn=0;38;2;255;184;108:*.nb=0;38;2;255;184;108:*.pl=0;38;2;255;184;108:*.pm=0;38;2;255;184;108:*.pp=0;38;2;255;184;108:*.ps=0;38;2;255;184;108:*.py=0;38;2;255;184;108:*.rb=0;38;2;255;184;108:*.rm=1;38;2;255;184;108:*.rs=0;38;2;255;184;108:*.sh=0;38;2;255;184;108:*.so=0;38;2;80;250;123:*.td=0;38;2;255;184;108:*.ts=0;38;2;255;184;108:*.ui=0;38;2;255;184;108:*.vb=0;38;2;255;184;108:*.wv=0;38;2;139;233;253:*.xz=1;38;2;255;85;85:*.aif=0;38;2;139;233;253:*.ape=0;38;2;139;233;253:*.apk=1;38;2;255;85;85:*.arj=1;38;2;255;85;85:*.asa=0;38;2;255;184;108:*.aux=0;38;2;58;60;78:*.avi=1;38;2;255;184;108:*.awk=0;38;2;255;184;108:*.bag=1;38;2;255;85;85:*.bak=0;38;2;58;60;78:*.bat=0;38;2;80;250;123:*.bbl=0;38;2;58;60;78:*.bcf=0;38;2;58;60;78:*.bib=0;38;2;255;184;108:*.bin=1;38;2;255;85;85:*.blg=0;38;2;58;60;78:*.bmp=0;38;2;255;121;198:*.bsh=0;38;2;255;184;108:*.bst=0;38;2;255;184;108:*.bz2=1;38;2;255;85;85:*.c++=0;38;2;255;184;108:*.cfg=0;38;2;255;184;108:*.cgi=0;38;2;255;184;108:*.clj=0;38;2;255;184;108:*.com=0;38;2;80;250;123:*.cpp=0;38;2;255;184;108:*.css=0;38;2;255;184;108:*.csv=0;38;2;255;184;108:*.csx=0;38;2;255;184;108:*.cxx=0;38;2;255;184;108:*.deb=1;38;2;255;85;85:*.def=0;38;2;255;184;108:*.dll=0;38;2;80;250;123:*.dmg=1;38;2;255;85;85:*.doc=0;38;2;255;184;108:*.dot=0;38;2;255;184;108:*.dox=0;38;2;255;184;108:*.dpr=0;38;2;255;184;108:*.elc=0;38;2;255;184;108:*.elm=0;38;2;255;184;108:*.epp=0;38;2;255;184;108:*.eps=0;38;2;255;121;198:*.erl=0;38;2;255;184;108:*.exe=0;38;2;80;250;123:*.exs=0;38;2;255;184;108:*.fls=0;38;2;58;60;78:*.flv=1;38;2;255;184;108:*.fnt=0;38;2;255;184;108:*.fon=0;38;2;255;184;108:*.fsi=0;38;2;255;184;108:*.fsx=0;38;2;255;184;108:*.gif=0;38;2;255;121;198:*.git=0;38;2;58;60;78:*.gvy=0;38;2;255;184;108:*.h++=0;38;2;255;184;108:*.hpp=0;38;2;255;184;108:*.htc=0;38;2;255;184;108:*.htm=0;38;2;255;184;108:*.hxx=0;38;2;255;184;108:*.ico=0;38;2;255;121;198:*.ics=0;38;2;255;184;108:*.idx=0;38;2;58;60;78:*.ilg=0;38;2;58;60;78:*.img=1;38;2;255;85;85:*.inc=0;38;2;255;184;108:*.ind=0;38;2;58;60;78:*.ini=0;38;2;255;184;108:*.inl=0;38;2;255;184;108:*.ipp=0;38;2;255;184;108:*.iso=1;38;2;255;85;85:*.jar=1;38;2;255;85;85:*.jpg=0;38;2;255;121;198:*.kex=0;38;2;255;184;108:*.kts=0;38;2;255;184;108:*.log=0;38;2;58;60;78:*.ltx=0;38;2;255;184;108:*.lua=0;38;2;255;184;108:*.m3u=0;38;2;139;233;253:*.m4a=0;38;2;139;233;253:*.m4v=1;38;2;255;184;108:*.mid=0;38;2;139;233;253:*.mir=0;38;2;255;184;108:*.mkv=1;38;2;255;184;108:*.mli=0;38;2;255;184;108:*.mov=1;38;2;255;184;108:*.mp3=0;38;2;139;233;253:*.mp4=1;38;2;255;184;108:*.mpg=1;38;2;255;184;108:*.nix=0;38;2;255;184;108:*.odp=0;38;2;255;184;108:*.ods=0;38;2;255;184;108:*.odt=0;38;2;255;184;108:*.ogg=0;38;2;139;233;253:*.org=0;38;2;255;184;108:*.otf=0;38;2;255;184;108:*.out=0;38;2;58;60;78:*.pas=0;38;2;255;184;108:*.pbm=0;38;2;255;121;198:*.pdf=0;38;2;255;184;108:*.pgm=0;38;2;255;121;198:*.php=0;38;2;255;184;108:*.pid=0;38;2;58;60;78:*.pkg=1;38;2;255;85;85:*.png=0;38;2;255;121;198:*.pod=0;38;2;255;184;108:*.ppm=0;38;2;255;121;198:*.pps=0;38;2;255;184;108:*.ppt=0;38;2;255;184;108:*.pro=0;38;2;255;184;108:*.ps1=0;38;2;255;184;108:*.psd=0;38;2;255;121;198:*.pyc=0;38;2;58;60;78:*.pyd=0;38;2;58;60;78:*.pyo=0;38;2;58;60;78:*.rar=1;38;2;255;85;85:*.rpm=1;38;2;255;85;85:*.rst=0;38;2;255;184;108:*.rtf=0;38;2;255;184;108:*.sbt=0;38;2;255;184;108:*.sql=0;38;2;255;184;108:*.sty=0;38;2;58;60;78:*.svg=0;38;2;255;121;198:*.swf=1;38;2;255;184;108:*.swp=0;38;2;58;60;78:*.sxi=0;38;2;255;184;108:*.sxw=0;38;2;255;184;108:*.tar=1;38;2;255;85;85:*.tbz=1;38;2;255;85;85:*.tcl=0;38;2;255;184;108:*.tex=0;38;2;255;184;108:*.tgz=1;38;2;255;85;85:*.tif=0;38;2;255;121;198:*.tml=0;38;2;255;184;108:*.tmp=0;38;2;58;60;78:*.toc=0;38;2;58;60;78:*.tsx=0;38;2;255;184;108:*.ttf=0;38;2;255;184;108:*.txt=0;38;2;255;184;108:*.vcd=1;38;2;255;85;85:*.vim=0;38;2;255;184;108:*.vob=1;38;2;255;184;108:*.wav=0;38;2;139;233;253:*.wma=0;38;2;139;233;253:*.wmv=1;38;2;255;184;108:*.xcf=0;38;2;255;121;198:*.xlr=0;38;2;255;184;108:*.xls=0;38;2;255;184;108:*.xml=0;38;2;255;184;108:*.xmp=0;38;2;255;184;108:*.yml=0;38;2;255;184;108:*.zip=1;38;2;255;85;85:*.zsh=0;38;2;255;184;108:*.zst=1;38;2;255;85;85:*TODO=1;38;2;255;184;108:*hgrc=0;38;2;255;184;108:*.bash=0;38;2;255;184;108:*.conf=0;38;2;255;184;108:*.dart=0;38;2;255;184;108:*.diff=0;38;2;255;184;108:*.docx=0;38;2;255;184;108:*.epub=0;38;2;255;184;108:*.fish=0;38;2;255;184;108:*.flac=0;38;2;139;233;253:*.h264=1;38;2;255;184;108:*.hgrc=0;38;2;255;184;108:*.html=0;38;2;255;184;108:*.java=0;38;2;255;184;108:*.jpeg=0;38;2;255;121;198:*.json=0;38;2;255;184;108:*.less=0;38;2;255;184;108:*.lisp=0;38;2;255;184;108:*.lock=0;38;2;58;60;78:*.make=0;38;2;255;184;108:*.mpeg=1;38;2;255;184;108:*.opus=0;38;2;139;233;253:*.orig=0;38;2;58;60;78:*.pptx=0;38;2;255;184;108:*.psd1=0;38;2;255;184;108:*.psm1=0;38;2;255;184;108:*.purs=0;38;2;255;184;108:*.rlib=0;38;2;58;60;78:*.sass=0;38;2;255;184;108:*.scss=0;38;2;255;184;108:*.tbz2=1;38;2;255;85;85:*.tiff=0;38;2;255;121;198:*.toml=0;38;2;255;184;108:*.webm=1;38;2;255;184;108:*.webp=0;38;2;255;121;198:*.woff=0;38;2;255;184;108:*.xbps=1;38;2;255;85;85:*.xlsx=0;38;2;255;184;108:*.yaml=0;38;2;255;184;108:*.cabal=0;38;2;255;184;108:*.cache=0;38;2;58;60;78:*.class=0;38;2;58;60;78:*.cmake=0;38;2;255;184;108:*.dyn_o=0;38;2;58;60;78:*.ipynb=0;38;2;255;184;108:*.mdown=0;38;2;255;184;108:*.patch=0;38;2;255;184;108:*.scala=0;38;2;255;184;108:*.shtml=0;38;2;255;184;108:*.swift=0;38;2;255;184;108:*.toast=1;38;2;255;85;85:*.xhtml=0;38;2;255;184;108:*README=0;38;2;255;184;108:*passwd=0;38;2;255;184;108:*shadow=0;38;2;255;184;108:*.config=0;38;2;255;184;108:*.dyn_hi=0;38;2;58;60;78:*.flake8=0;38;2;255;184;108:*.gradle=0;38;2;255;184;108:*.groovy=0;38;2;255;184;108:*.ignore=0;38;2;255;184;108:*.matlab=0;38;2;255;184;108:*COPYING=0;38;2;255;184;108:*INSTALL=0;38;2;255;184;108:*LICENSE=0;38;2;255;184;108:*TODO.md=1;38;2;255;184;108:*.desktop=0;38;2;255;184;108:*.gemspec=0;38;2;255;184;108:*Doxyfile=0;38;2;255;184;108:*Makefile=0;38;2;255;184;108:*TODO.txt=1;38;2;255;184;108:*setup.py=0;38;2;255;184;108:*.DS_Store=0;38;2;58;60;78:*.cmake.in=0;38;2;255;184;108:*.fdignore=0;38;2;255;184;108:*.kdevelop=0;38;2;255;184;108:*.markdown=0;38;2;255;184;108:*.rgignore=0;38;2;255;184;108:*COPYRIGHT=0;38;2;255;184;108:*README.md=0;38;2;255;184;108:*configure=0;38;2;255;184;108:*.gitconfig=0;38;2;255;184;108:*.gitignore=0;38;2;255;184;108:*.localized=0;38;2;58;60;78:*.scons_opt=0;38;2;58;60;78:*CODEOWNERS=0;38;2;255;184;108:*Dockerfile=0;38;2;255;184;108:*INSTALL.md=0;38;2;255;184;108:*README.txt=0;38;2;255;184;108:*SConscript=0;38;2;255;184;108:*SConstruct=0;38;2;255;184;108:*.gitmodules=0;38;2;255;184;108:*.synctex.gz=0;38;2;58;60;78:*.travis.yml=0;38;2;255;184;108:*INSTALL.txt=0;38;2;255;184;108:*LICENSE-MIT=0;38;2;255;184;108:*MANIFEST.in=0;38;2;255;184;108:*Makefile.am=0;38;2;255;184;108:*Makefile.in=0;38;2;58;60;78:*.applescript=0;38;2;255;184;108:*.fdb_latexmk=0;38;2;58;60;78:*CONTRIBUTORS=0;38;2;255;184;108:*appveyor.yml=0;38;2;255;184;108:*configure.ac=0;38;2;255;184;108:*.clang-format=0;38;2;255;184;108:*.gitattributes=0;38;2;255;184;108:*.gitlab-ci.yml=0;38;2;255;184;108:*CMakeCache.txt=0;38;2;58;60;78:*CMakeLists.txt=0;38;2;255;184;108:*LICENSE-APACHE=0;38;2;255;184;108:*CONTRIBUTORS.md=0;38;2;255;184;108:*.sconsign.dblite=0;38;2;58;60;78:*CONTRIBUTORS.txt=0;38;2;255;184;108:*requirements.txt=0;38;2;255;184;108:*package-lock.json=0;38;2;58;60;78:*.CFUserTextEncoding=0;38;2;58;60;78"
export EXA_COLORS="uu=0:gu=0:ur=0:uw=0:gr=0:gw=0:tr=0:tw=0:da=33:hd=2;4"

# FZF defaults
export FZF_DEFAULT_OPTS=" \
    --ansi --color=fg:#abb2bf,bg:#282c34,hl:#61afef \
    --color=fg+:#d0d0d0,bg+:#464d5c,hl+:#9fd1f2 \
    --color=info:#e5c07b,prompt:#e06c75,pointer:#c678dd \
    --color=marker:#98c378,spinner:#c678dd,header:#56b6c2 \
    --height 60% \
    --border sharp \
    --layout reverse \
    --prompt '∷ ' \
    --pointer ▶ \
    --marker ⇒ \
    --preview='bat --style numbers --color=always {}' \
    --bind='F1:toggle-preview'"

export FZF_DEFAULT_COMMAND='fd . --type file --hidden --exclude ".git" --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"