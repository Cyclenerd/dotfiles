#!/usr/bin/env bash

#
# Author: Nils Knieling - https://github.com/Cyclenerd/dotfiles
#

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
killall Activity\ Monitor

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true