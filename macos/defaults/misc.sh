#!/usr/bin/env bash

#
# Author: Nils Knieling - https://github.com/Cyclenerd/dotfiles
#

restart_process() {
	if ! killall "$1" >/dev/null 2>&1; then
		echo "Warning: failed to restart $1; continuing..."
	fi
}

# Enable Dark Mode
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Set Accent color to green
defaults write NSGlobalDomain AppleAccentColor -int "3"

# Set highlight color to green
defaults write NSGlobalDomain AppleHighlightColor -string "0.752941 0.964706 0.678431 Green"

# Disable transparency and motion
defaults write com.apple.universalaccess reduceTransparency -bool true
defaults write com.apple.universalaccess reduceMotion -bool true
defaults write com.apple.universalaccess showWindowTitlebarIcons -bool true

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Show the current CPU usages, as a verticle meter.
defaults write com.apple.ActivityMonitor "IconType" -int "5"

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Disable startup boot chime
sudo nvram StartupMute=%01

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Clock
defaults write com.apple.menuextra.clock ShowAMPM -bool false
defaults write com.apple.menuextra.clock ShowDate -int 2
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool false

restart_process Finder
restart_process "Activity Monitor"

echo "Done"
