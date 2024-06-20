#
# Added by dotfile.sh script
#   https://github.com/Cyclenerd/dotfiles
#

if [ "$(id -u)" -eq 0 ]; then
	# Set RED prompt for root
	PS1='\[\033[01;31m\]\u@\h \[\033[01;34m\]\W # \[\033[00m\]'
	export PS1
else
	PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\W \$ \[\033[00m\]'
	export PS1
fi

# Remove IP or Server from known_hosts
alias ssh-keydel='ssh-keygen -f .ssh/known_hosts -R'

# Terraform
alias tf='terraform'
alias tfa='terraform apply'
alias tfc='terraform console'
alias tfd='terraform destroy'
alias tff='terraform fmt'
alias tfi='terraform init'
alias tfiu='terraform init -upgrade'
alias tfo='terraform output'
alias tfp='terraform plan'
alias tfv='terraform validate'
alias tfs='terraform state'
alias tft='terraform test'
alias tfsh='terraform show'

# Define nano as our default EDITOR
export EDITOR='nano'

export LC_CTYPE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'