# macOS

My notes and scripts to quickly configure a new Mac.


## Full Disk Access

⚠️ Some command requires to grant full disk access to the `Terminal.app`.

Edit: System Preferences → Privacy & Security → Full Disk Access

![Screenshot: Full Disk Access](./full_disk_access.png)


## FileVault

Enable disk encrypting.

![Screenshot: FileVault](./filevault.png)


## Homebrew

Website: <https://brew.sh/>

Install the missing package manager for macOS:

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Packages

```shell
brew install curl wget
brew install htop
brew install git
brew install nano sqlite jq shellcheck flake8
brew install ansible terraform terraform-docs
brew install imagemagick jhead
brew install skopeo
# Perl
brew install perl
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5" cpan local::lib
brew install cpanminus pkg-config
```


## Applications

### Firefox

Website: <https://www.mozilla.org/en-US/firefox/new/>

German Dictionary: <https://addons.mozilla.org/en-US/firefox/addon/dictionary-german/>

### Chrome

Website: <https://www.google.com/chrome/>

### Visual Studio Code

Website: <https://code.visualstudio.com/docs/setup/mac>

Download: <https://code.visualstudio.com/Download>

#### Launching from the command line

You can also run VS Code from the terminal by typing 'code' after adding it to the path:

1. Launch VS Code.
1. Open the Command Palette (<kbd>Cmd</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd>) and type `shell command` to find the Shell Command: Install 'code' command in PATH command.

#### Setting

Open Settings (<kbd>Cmd</kbd>+<kbd>,</kbd>) and copy JSON settings: [vscode.json](vscode.json)

#### Extensions

Install extensions:
```shell
code --install-extension dracula-theme.theme-dracula
code --install-extension install vscode-icons
code --install-extension samosad.tt
code --install-extension ms-azuretools.vscode-docker
code --install-extension hashicorp.terraform
code --install-extension redhat.ansible
code --install-extension ZainChen.json
code --install-extension mechatroner.rainbow-csv
code --install-extension redhat.vscode-yaml
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension GitLab.gitlab-workflow
```

To install a extension you can also just execute the following command in the Command Palette of Visual Studio Code:

```text
ext install vscode-icons
```

### Google Cloud CLI

Website: <https://cloud.google.com/sdk/docs/install>

```shell
brew install --cask google-cloud-sdk
```

### DB Browser for SQLite

Website: <https://sqlitebrowser.org/dl/>

```shell
brew install --cask db-browser-for-sqlite
```

### Manually

Watch out! Not all apps are optimized for the Apple Silicon CPU!

![Screenshot: App Info](intel-universal-apple.png)

| Software | Apple Silicon |
|----------|---------------|
| [KeePassXC](https://keepassxc.org/download/#mac) | ✅ |
| [Spotify](https://www.spotify.com/de/download/mac/>) | ✅ |
| [LibreOffice](https://www.libreoffice.org/download/download-libreoffice/) | ✅ |
| [Adobe Acrobat Reader](https://www.adobe.com/acrobat/pdf-reader.html) | ✅ |
| [Sourcetree](https://www.sourcetreeapp.com/) | ✅ |
| [Audacity](https://www.audacityteam.org/download/mac/) | ✅ |
| [Elgato Control Center](https://www.elgato.com/en/downloads) | ✅ |
| [Geekbench 6](https://www.geekbench.com/download/) | ✅ |
| [OBS](https://obsproject.com/) | ✅ |
| [VLC](https://www.videolan.org/vlc/) | ✅ |
| [Shotcut](https://www.shotcut.org/download/) | ✅ |
| [Poedit](https://poedit.net/download>) | ✅ |
| [qFlipper](https://flipperzero.one/update) | ✅ |
| [QMK Toolbox](https://github.com/qmk/qmk_toolbox/releases/latest) | ✅ |
| [GoldenCheetah](http://www.goldencheetah.org/#section-download) | ❌ |
| [Garmin Express](https://www.garmin.com/en-US/software/express/mac/>) | ❌ |
| [Google Earth Pro](https://www.google.com/earth/versions/#download-pro>) | ❌ |
| [Logitech G HUB](https://download01.logi.com/web/ftp/pub/techsupport/gaming/lghub_installer.zip) | ❌ |

### App Store

* [Xcode](https://apps.apple.com/de/app/xcode/id497799835?l=en&mt=12)
    * FileMerge (opendiff) is bundled with Xcode. "Show Package Contents" of Xcode -> Contents -> Applications -> FileMerge.app
* [Commander One PRO](https://apps.apple.com/de/app/commander-one-pro-ftp-client/id1035237815?l=en&mt=12>)
* [The Unarchiver](https://apps.apple.com/de/app/the-unarchiver/id425424353?l=en&mt=12)
* [Greenshot](https://apps.apple.com/de/app/greenshot/id1103915944?l=en&mt=12)
* [dict.cc plus](https://apps.apple.com/de/app/dict-cc-dictionary/id521791825?l=en)


## Terminal

Import [`Dracula.terminal`](./Dracula.terminal) into Terminal Settings (<kbd>Cmd</kbd>+<kbd>,</kbd>)

![Screenshot: Terminal Settings](./terminal-settings.png)

Remap Keyboad shortcuts:

| Custom          | Default                         | Action                                                |
|-----------------|---------------------------------|-------------------------------------------------------|
| <kbd>Home</kbd> | <kbd>Control</kbd>+<kbd>A</kbd> | Move the insertion point to the beginning of the line |
| <kbd>End</kbd>  | <kbd>Control</kbd>+<kbd>E</kbd> | Move the insertion point to the beginning of the line |

More help: <https://support.apple.com/guide/terminal/keyboard-shortcuts-trmlshtcts/mac>

### Add Mapping

![Screenshot: Terminal - Add Mapping](./terminal-add-mapping.png?v1)

### Mapping

![Screenshot: Terminal - Keyboard](./terminal-keyboard.png?v1)


## Themes / Fonts

### Source Code Pro

Website: <https://adobe-fonts.github.io/source-code-pro/>

Download TTF: <https://fonts.google.com/download?family=Source%20Code%20Pro>

Install: `SourceCodePro-Medium.ttf`

### Roboto

Download TTF: <https://fonts.google.com/download?family=Roboto>

Install: `Roboto-Regular.ttf`

### Dracula

* Terminal: <https://draculatheme.com/terminal>
    * Download: <https://github.com/dracula/terminal-app/archive/master.zip>
* Visual Studio Code:
    1. Go to View -> Command Palette or press <kbd>Cmd</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd>
    1. Then enter Install Extension
    1. Write `Dracula Official`
    1. Select it or press <kbd>Enter</kbd> to install


## Hardware

### MOTU M2

Website: <https://motu.com/en-us/products/m-series/m2/getting-started/>

No extra drivers needed!

### EPSON WF-3820 Series

Website: <https://support.epson.net/setupnavi/?LG2=EN&OSC=MI&MKN=WF-3820&PINF=menu&linkflg=alllist>

Download: <https://download.ebz.epson.net/dsc/du/02/DriverDownloadInfo.do?LG2=EN&CN2=US&CTI=59&PRN=WF-3820%20Series&OSC=MI&DL>


## Hypervisor Virtualization

### Parallels Desktop

Download: <https://www.parallels.com/de/products/desktop/trial/>

### UTM Virtual Machines

Website: <https://mac.getutm.app/>

Link: <https://apps.apple.com/de/app/utm-virtual-machines/id1538878817?l=en&mt=12>

#### Images

* [Ubuntu](https://ubuntu.com/download/server/arm)
* [Rocky](https://rockylinux.org/download)


## Defaults

For most settings I have saved the macOS `defaults`.
You can find them in the [defaults](./defaults/) folder.

Run the scripts only after all programs, themes and fonts are installed.

