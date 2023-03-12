#!/usr/bin/env bash

#
# Change Finder.app settings
#
# Author: Nils Knieling - https://github.com/Cyclenerd/dotfiles
#

# Allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Show hidden files
defaults write com.apple.finder "AppleShowAllFiles" -bool "false"

# Show all file extensions inside the Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# Show icon in the title bar
defaults write com.apple.universalaccess "showWindowTitlebarIcons" -bool "true"

# Show path bar
defaults write com.apple.finder "ShowPathbar" -bool "true"

# Keep folders on top
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"

# Do not display the warning when changing the file extension
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"

# Disable iCloud Documents as directory opened in the fileviewer dialog when saving a new document
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Restart
killall Finder