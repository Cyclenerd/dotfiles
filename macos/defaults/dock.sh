#!/usr/bin/env bash

#
# Change Dock settings
#
# Author: Nils Knieling - https://github.com/Cyclenerd/dotfiles
#

restart_process() {
	if ! killall "$1" >/dev/null 2>&1; then
		echo "Warning: failed to restart $1; continuing..."
	fi
}

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Change minimize/maximize window effect
defaults write com.apple.dock "mineffect" -string "scale"

# Icon size
defaults write com.apple.dock "tilesize" -int "32"
defaults write com.apple.dock "largesize" -int "32"

# Autohide the Dock when the mouse is out
defaults write com.apple.dock "autohide" -bool "true"

# Remove delay
defaults write com.apple.dock "autohide-time-modifier" -float "0"
defaults write com.apple.dock "autohide-delay" -float "0"

# Do not display recent apps in the Dock
defaults write com.apple.dock "show-recents" -bool "false"

# Disable Stage Manager and keep standard Desktop reveal behavior
defaults write com.apple.WindowManager GloballyEnabled -bool false
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# Remove all widgets from desktop
defaults write com.apple.WindowManager EnableTiledWindowMargins -bool false
# Show Desktop icons
defaults write com.apple.WindowManager HideDesktop -bool false

defaults write com.apple.WindowManager StandardHideWidgets -bool true
defaults write com.apple.WindowManager StageManagerHideWidgets -bool true

# Reset hot corners before applying them again
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0
restart_process Dock
sleep 1

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen

# Top left screen corner → Desktop
# The top-right corner is unreliable on recent macOS releases because the
# menu bar / Control Center can consume that corner before Hot Corners sees it.
defaults write com.apple.dock wvous-tl-corner -int 4
defaults write com.apple.dock wvous-tl-modifier -int 0
# Bottom left screen corner → Mission Control
defaults write com.apple.dock wvous-bl-corner -int 2
defaults write com.apple.dock wvous-bl-modifier -int 0

# Restart
restart_process WindowManager
restart_process Dock
restart_process ControlCenter

echo "Done"
