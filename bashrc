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

alias drobo='~/Scripts/drobo.sh'
alias gallery='~/Scripts/gallery.sh'
alias veloheroup='~/Scripts/veloheroup'
alias volume='~/Scripts/volume.sh'
alias brightness='~/Scripts/brightness.sh'

# Remove IP or Server from known_hosts
alias ssh-keydel='ssh-keygen -f .ssh/known_hosts -R'

# Define nano as our default EDITOR
export EDITOR='nano'

export LC_CTYPE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'