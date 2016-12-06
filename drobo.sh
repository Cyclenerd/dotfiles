#!/bin/bash

# drobo.sh
# Author: Nils Knieling - https://github.com/Cyclenerd/dotfiles

# Script to mount NAS (Drobo) shares with...
#    ...'osascript' (Finder) under macOS or
#    ...'gvfs-mount' (PCManFM) under Linux.

################################################################################
#### Configuration Section
################################################################################

MY_USERNAME="nils"
MY_NAS="drobo.fritz.box"
MY_SHARES=(
	"Backup"
	"Datentonne"
	"Movies"
	"Music"
	"Photos"
	"Public"
	# Time Maschine "Zeitreise"
)

################################################################################
#### END Configuration Section
################################################################################


ME=$(basename "$0")


################################################################################
# Usage
################################################################################

function usage {
	returnCode="$1"
	echo -e "Usage: $ME SHARE"
	echo "SHARE:"
	for MY_SHARE in "${MY_SHARES[@]}"; do
		printf "\t%s\n" "$MY_SHARE"
	done
	exit "$returnCode"
}


################################################################################
# Helper
################################################################################

# command_exists() tells if a given command exists.
function command_exists() {
	command -v "$1" >/dev/null 2>&1
}


################################################################################
# MAIN
################################################################################

for MY_SHARE in "${MY_SHARES[@]}"; do
	if [[ "$MY_SHARE" == "$1" ]]; then
		if command_exists osascript; then
			# macOS
			osascript -e "try" -e "mount volume \"smb://$MY_USERNAME@$MY_NAS/$MY_SHARE\"" -e "end try"
		elif command_exists gvfs-mount; then
			# Linux (package 'gvfs-smb' needed)
			gvfs-mount "smb://$MY_USERNAME@$MY_NAS/$MY_SHARE"
		else
			echo "Either 'osascript' (macOS) or 'gvfs-mount' (Linux) are needed."
			exit 9
		fi
		MY_OK="1"
		break
	fi
done
if [[ MY_OK -eq "1" ]]; then
	exit 0
else
	usage 1
fi