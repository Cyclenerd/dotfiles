#!/bin/bash

ME=$(basename "$0")

function usage {
	returnCode="$1"
	echo -e "Usage: $ME YES or NO"
	exit "$returnCode"
}

if [ "$1" == 'yes' ]; then
	defaults write com.apple.finder AppleShowAllFiles YES
	killall "Finder"
elif [ "$1" == 'no' ]; then
	defaults write com.apple.finder AppleShowAllFiles NO
	killall "Finder"
else
	usage 1
fi
