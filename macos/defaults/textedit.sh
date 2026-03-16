#!/usr/bin/env bash

#
# Change TextEdit.app settings
#
# Author: Nils Knieling - https://github.com/Cyclenerd/dotfiles
#

restart_process() {
	if ! killall "$1" >/dev/null 2>&1; then
		echo "Warning: failed to restart $1; continuing..."
	fi
}

# Disabled rich text / Text is default
defaults write com.apple.TextEdit "RichText" -bool "false"

# Text settings
defaults write com.apple.TextEdit "CheckSpellingAsYouTypeEnabledInRichTextOnly" -bool "true"
defaults write com.apple.TextEdit "CheckSpellingWhileTyping" -bool "false"
defaults write com.apple.TextEdit "NSFixedPitchFont" -string "SourceCodePro-Regular";
defaults write com.apple.TextEdit "NSFixedPitchFontSize" -int "16";
defaults write com.apple.TextEdit "NSFontPanelAttributes" -string "1, 0";
defaults write com.apple.TextEdit "NSNavLastRootDirectory" -string "~/Desktop";

restart_process TextEdit

echo "Done"
