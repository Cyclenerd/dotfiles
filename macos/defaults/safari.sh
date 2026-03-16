#!/usr/bin/env bash

#
# Change Safari.app settings
#
# Author: Nils Knieling - https://github.com/Cyclenerd/dotfiles
#

set -euo pipefail

readonly SAFARI_DOMAIN="com.apple.Safari"
readonly SAFARI_PREFERENCES_DIR="${HOME}/Library/Containers/com.apple.Safari/Data/Library/Preferences"
readonly SAFARI_PREFERENCES_PLIST="${SAFARI_PREFERENCES_DIR}/com.apple.Safari.plist"

require_safari_preferences_access() {
	if [[ -r "${SAFARI_PREFERENCES_PLIST}" && -w "${SAFARI_PREFERENCES_PLIST}" ]]; then
		return
	fi

	if [[ -r "${SAFARI_PREFERENCES_DIR}" && -w "${SAFARI_PREFERENCES_DIR}" ]]; then
		return
	fi

	cat >&2 <<'EOF'
Unable to update Safari preferences.
Safari stores its settings in a protected container on recent macOS releases.
Grant your terminal app Full Disk Access, relaunch it, and rerun this script:
System Settings -> Privacy & Security -> Full Disk Access
EOF
	exit 1
}

quit_safari_if_running() {
	if pgrep -x "Safari" >/dev/null 2>&1; then
		osascript -e 'tell application id "com.apple.Safari" to quit' >/dev/null 2>&1 || true

		# Give Safari a moment to flush preferences and exit cleanly.
		for _ in {1..10}; do
			if ! pgrep -x "Safari" >/dev/null 2>&1; then
				return
			fi
			sleep 1
		done
	fi
}

write_safari_default() {
	local key="$1"
	shift

	local output
	if output=$(defaults write "${SAFARI_DOMAIN}" "${key}" "$@" 2>&1); then
		return
	fi

	printf '%s\n' "${output}" >&2

	exit 1
}

require_safari_preferences_access
quit_safari_if_running

write_safari_default "AutoOpenSafeDownloads" -bool false
write_safari_default "SearchProviderShortName" -string "DuckDuckGo"

# Show the full URL in the address bar (note: this still hides the scheme)
write_safari_default "ShowFullURLInSmartSearchField" -bool true

# Set Safari's home page to `about:blank` for faster loading
write_safari_default "HomePage" -string "about:blank"

echo "Done"