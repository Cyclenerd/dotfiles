#
# Change Safari.app settings
#
# Author: Nils Knieling - https://github.com/Cyclenerd/dotfiles
#

defaults write com.apple.Safari "AutoOpenSafeDownloads" -bool "false"
defaults write com.apple.Safari "SearchProviderShortName" -string "DuckDuckGo"

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

killall Safari