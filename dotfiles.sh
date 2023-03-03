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

# Backup
if [ -f "$HOME/.profile" ]; then
	cp "$HOME/.profile" "$HOME/.profile.ORIG"
fi
if [ -f "$HOME/.bashrc" ]; then
	cp "$HOME/.bashrc" "$HOME/.bashrc.ORIG"
fi

# .profile
echo "" >> "$HOME/.profile"
if $FETCHER "https://raw.githubusercontent.com/Cyclenerd/dotfiles/master/profile" >> "$HOME/.profile"; then
	echo "    $HOME/.profile"
	echo "" >> "$HOME/.profile"
else
	echo_warning "Failed to install '.profile'"
fi

# .bashrc
BASHRC="$HOME/.bashrc"
echo "" >> "$BASHRC"
if $FETCHER "https://raw.githubusercontent.com/Cyclenerd/dotfiles/master/bashrc" >> "$BASHRC"; then
	echo "    $BASHRC"
	echo "" >> "$BASHRC"
else
	echo_warning "Failed to install '.bashrc'"
fi

# ls in color
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
# gitconfig
################################################################################

if $FETCHER "https://raw.githubusercontent.com/Cyclenerd/dotfiles/master/gitconfig" -o "$HOME/.gitconfig"; then
	echo "    $HOME/.gitconfig"
else
	echo_warning "Failed to install '.gitconfig'"
fi

################################################################################
# Create a global .gitignore
################################################################################

if $FETCHER "https://raw.githubusercontent.com/Cyclenerd/dotfiles/master/gitignore_global" -o "$HOME/.gitignore_global"; then
	echo "    $HOME/.gitignore_global"
	git config --global core.excludesfile ~/.gitignore_global
else
	echo_warning "Failed to install '.gitignore_global'"
fi


################################################################################
# Visual Studio Code setting.json
################################################################################
if [ -d "$HOME/Library/Application Support/Code/User" ]; then
	if $FETCHER "https://raw.githubusercontent.com/Cyclenerd/dotfiles/master/vscode.json" -o "$HOME/Library/Application Support/Code/User/settings.json"; then
		echo "    $HOME/Library/Application Support/Code/User/settings.json"
	else
		echo_warning "Failed to install Visual Studio Code 'settings.json'"
	fi
fi


################################################################################
# Scripts
################################################################################

if [ -d "$HOME/Scripts" ]; then
	echo "    $HOME/Scripts"
else
	echo "    mkdir $HOME/Scripts"
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


echo "👍  Done. Note that some of these changes require a logout/restart to take effect."