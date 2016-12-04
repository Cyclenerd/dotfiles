#!/bin/bash

# dotfiles.sh
# Author: Nils Knieling - https://github.com/Cyclenerd/dotfiles

# Bash Script to automate post-installation steps. Helps to 
#  install dotfiles and
#  perform user-defined configurations.

################################################################################
# Helpers
################################################################################

# command_exists() tells if a given command exists.
function command_exists() {
	command -v "$1" >/dev/null 2>&1
}

# exit_with_message() outputs and logs a message before exiting the script.
function exit_with_message() {
	echo
	echo "☠  FAILURE: $1"
	echo
	exit 1
}

# echo_warning() outputs a message with warning icon.
function echo_warning() {
	echo "    ⚠️  $1, will attempt to continue..."
}

# check_fetcher() check if curl is installed
function check_fetcher() {
	if command_exists curl; then
		# -f = Fail silently (no output at all) on server errors (404, 301, ...).
		export FETCHER="curl -fs"
	else
		exit_with_failure "'curl' is needed. Please install 'curl'. More details can be found at https://curl.haxx.se/"
	fi
}


################################################################################
# Main
################################################################################

check_fetcher


################################################################################
# HOME
################################################################################

if [ -d "$HOME" ]; then
	echo "🏠  $HOME"
else
	exit_with_message "$HOME does not exist"
fi


################################################################################
# bashrc
################################################################################

# .profile or .bashrc
if [ -f "$HOME/.profile" ]; then
	export BASHRC="$HOME/.profile"
else
	export BASHRC="$HOME/.bashrc"
fi

echo "    $BASHRC"

cp "$BASHRC" "$BASHRC.ORIG"
cat >> "$BASHRC" << EOF

#
# Added by dotfile.sh script
#   https://github.com/Cyclenerd/dotfiles
#

PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\W \$ \[\033[00m\]'; export PS1

alias gallery='~/Scripts/gallery.sh'
alias veloheroup='~/Scripts/veloheroup'
alias volume='~/Scripts/volume.sh'
alias brightness='~/Scripts/brightness.sh'

# Define nano as our default EDITOR
export EDITOR='nano'

export LC_CTYPE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

EOF

# BSD or GNU
if stat --version &>/dev/null; then
	# GNU
	echo "alias ll='ls -lah --color'" >> "$BASHRC"
else
	# BSD
	echo "alias ll='ls -lah -G'" >> "$BASHRC"
fi

# Use curl from Macports
if [ -f "/opt/local/bin/curl" ]; then
	echo "alias curl='/opt/local/bin/curl'" >> "$BASHRC"
fi


################################################################################
# screenrc
################################################################################

if $FETCHER "https://raw.githubusercontent.com/Cyclenerd/dotfiles/master/screenrc" -o "$HOME/.screenrc"; then
	echo "    $HOME/.screenrc"
else
	echo_warning "Failed to install '.screenrc'"
fi


################################################################################
# tmux.conf
################################################################################

if $FETCHER "https://raw.githubusercontent.com/Cyclenerd/dotfiles/master/tmux.conf" -o "$HOME/.tmux.conf"; then
	echo "    $HOME/.tmux.conf"
else
	echo_warning "Failed to install '.tmux.conf'"
fi


################################################################################
# nanorc
################################################################################

if $FETCHER "https://raw.githubusercontent.com/Cyclenerd/dotfiles/master/nanorc" -o "$HOME/.nanorc"; then
	echo "    $HOME/.nanorc"
else
	echo_warning "Failed to install '.nanorc'"
fi


################################################################################
# Scripts
################################################################################

if [ -d "$HOME/Scipts" ]; then
	echo "    $HOME/Scipts"
else
	echo "    mkdir $HOME/Scipts"
	mkdir "$HOME/Scripts"
fi

if $FETCHER "https://raw.githubusercontent.com/Cyclenerd/gallery_shell/master/gallery.sh" -o "$HOME/Scripts/gallery.sh"; then
	echo "    $HOME/Scripts/gallery.sh"
	chmod +x "$HOME/Scripts/gallery.sh"
else
	echo_warning "Failed to install 'gallery.sh'"
fi

if $FETCHER "https://raw.githubusercontent.com/Cyclenerd/veloheroup/master/veloheroup" -o "$HOME/Scripts/veloheroup"; then
	echo "    $HOME/Scripts/veloheroup"
	chmod +x "$HOME/Scripts/veloheroup"
else
	echo_warning "Failed to install 'veloheroup'"
fi

if $FETCHER "https://raw.githubusercontent.com/Cyclenerd/volume_shell/master/volume.sh" -o "$HOME/Scripts/volume.sh"; then
	echo "    $HOME/Scripts/volume.sh"
	chmod +x "$HOME/Scripts/volume.sh"
else
	echo_warning "Failed to install 'volume.sh'"
fi

if $FETCHER "https://raw.githubusercontent.com/Cyclenerd/brightness_shell/master/brightness.sh" -o "$HOME/Scripts/brightness.sh"; then
	echo "    $HOME/Scripts/brightness.sh"
	chmod +x "$HOME/Scripts/brightness.sh"
else
	echo_warning "Failed to install 'brightness.sh'"
fi


################################################################################
# macOS only
################################################################################

if [ -f /System/Library/CoreServices/SystemVersion.plist ]; then
	# shpotify is a simple Bash/Apple script to control Spotify from the command line on a Mac
	if $FETCHER "https://raw.githubusercontent.com/hnarayanan/shpotify/master/spotify" -o "$HOME/Scripts/shpotify.sh"; then
		echo "    $HOME/Scripts/shpotify.sh"
		chmod +x "$HOME/Scripts/shpotify.sh"
		echo "alias spotify='~/Scripts/shpotify.sh'" >> "$BASHRC"
	else
		echo_warning "Failed to install 'shpotify.sh'"
	fi
	
	# mysql from Macports
	echo 'export PATH="/opt/local/lib/mysql55/bin/:$PATH"' >> "$BASHRC"
fi


################################################################################
# SSH
################################################################################

if [ -f "$HOME/.ssh/id_rsa" ]; then
	echo "    SSH key already exists, will not generate new ones"
else
	mkdir "$HOME/.ssh"
	echo -e 'y\n'|ssh-keygen -q -t rsa -b 4096 -f "$HOME/.ssh/id_rsa" -N ""
	if [ "$?" -ne 0 ]; then
		echo_warning "Failed to generate SSH key"
	else
		chmod 700 "$HOME/.ssh"
		chmod 600 "$HOME/.ssh/id_rsa"
		echo "    $HOME/.ssh/id_rsa"
	fi
fi


echo "👍  Done"