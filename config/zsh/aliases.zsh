
# ls/exa aliases
if [ -x "$(command -v exa)" ]; then
    alias ls="exa --group-directories-first --classify"
    alias ll="exa --group-directories-first --classify --icons --header --git --long"
    alias la="exa --group-directories-first --classify --icons --header --git --long --all"
    alias lt="exa --group-directories-first --icons --tree"
    alias lta="exa --group-directories-first --icons --tree --all"
fi

# Alias docker to nerdctl
if [ -x "$(command -v nerdctl)" ]; then
    alias docker=nerdctl
fi

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
