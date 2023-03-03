#!/usr/bin/env bash

#
# Change TextEdit.app settings
#
# Author: Nils Knieling - https://github.com/Cyclenerd/dotfiles
#

# Disabled rich text / Text is default
defaults write com.apple.TextEdit "RichText" -bool "false"

# Text settings
defaults write com.apple.TextEdit "CheckSpellingAsYouTypeEnabledInRichTextOnly" -bool "true"
defaults write com.apple.TextEdit "CheckSpellingWhileTyping" -bool "false"
defaults write com.apple.TextEdit "NSFixedPitchFont" "SourceCodePro-Regular";
defaults write com.apple.TextEdit "NSFixedPitchFontSize" -int "16";
defaults write com.apple.TextEdit "NSFontPanelAttributes" "1, 0";
defaults write com.apple.TextEdit "NSNavLastRootDirectory" "~/Desktop";

killall TextEdit