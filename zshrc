PROMPT='%F{cyan}%d%f %F{green}>%f '

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Load .env with API keys
if [ -f "$HOME/.env" ]; then
  set -a
  source "$HOME/.env"
  set +a
fi

# VS Code
alias vsc='code .'

# Git
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git#aliases
alias g='git'
alias gl='git pull'
alias gp='git push'
alias gsh='git show'
alias gcam='git commit --all --message'
alias yolo='git commit -am "$(curl -s https://whatthecommit.com/index.txt)"'

alias lz='lazygit'

# Podman 🦭
alias docker='podman'

# Terraform
alias tf='terraform'
alias tfa='terraform apply'
alias tfc='terraform console'
alias tfd='terraform destroy'
alias tff='terraform fmt'
alias tfi='terraform init'
alias tfim='terraform init -migrate'
alias tfiu='terraform init -upgrade'
alias tfo='terraform output'
alias tfp='terraform plan'
alias tfr='terraform refresh'
alias tfs='terraform state'
alias tfsh='terraform show'
alias tft='terraform test'
alias tfv='terraform validate'

# Aliases
alias gcloud-auth-app='gcloud auth application-default login --no-launch-browser'
alias gcloud-auth='gcloud auth login --no-launch-browser'
alias ll='ls -lah'
alias ls='ls --color'
alias myip='curl -4 --silent http://whatismyip.akamai.com/'
alias plackup='plackup --host="127.0.0.1"'