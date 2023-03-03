#!/usr/bin/env bash

ME=$(basename "$0")

function usage {
	returnCode="$1"
	echo -e "Usage: $ME YES or NO"
	exit "$returnCode"
}

if [ "$1" == 'yes' ] || [ "$1" == 'YES' ]; then
	defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
	killall "Finder"
elif [ "$1" == 'no' ] || [ "$1" == 'NO' ]; then
	defaults write com.apple.finder "AppleShowAllFiles" -bool "false"
	killall "Finder"
else
	usage 1
fi
