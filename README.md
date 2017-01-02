# CMB Dotfiles

My configuration for development, mostly on Mac OSX but some of these can easily be used on Linux, especially anything zshell specific. I use robbyrussell's [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh) for the base of my zshell configuration.

## Getting Started

### Prerequisites

#### Homebrew

`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

#### Xcode Command Line Tools

During install of Homebrew, the script will kindly detect that you have not yet installed Xcode Command Line Tools, and pop up a dialog asking if you want to install it. Yes, you do. I defer to install the full Xcode until later since the download takes longer and I want to keep moving forward. For now, just the Xcode Command Line Tools.

Confirm the license:

`sudo xcodebuild -license`

#### Mac App Store Command Line Tools

The `mas` command by `argon` is a handy tool to interact with the App Store without needing to point and click, search, and otherwise need manual intervention. This lets us install the next batch of software very quickly using **Terminal**.

Now that Homebrew is installed, it's easy to get **mas**:

`brew install mas`

Then signin to the **Mac App Store** for the first time:

`mas signin YOUR@EMAIL.COM`

### Install binaries from a Brewfile (apps from App Store using mas, apps from Cask)

#### Retrieve Brewfile

`curl -o Brewfile https://gist.githubusercontent.com/kevinelliott/7a152c556a83b322e0a8cd2df128235c/raw/2-macOS-10.12-sierra-setup-brewfile`

#### Edit Brewfile for last minute changes

You may wish to add or remove a few App Store or Cask items before initiating Homebrew to install all of the applications. If you wish to review these now you may examine the [Brewfile](https://gist.githubusercontent.com/kevinelliott/7a152c556a83b322e0a8cd2df128235c/raw/2-macOS-10.12-sierra-setup-brewfile) now.

#### Install apps

`brew bundle install`

This will take some time, especially if you have a slow internet connection and because Xcode is huge. **But it's faster than you having to search the App Store app and click to install for each of these!**

### Install from Third-Party Websites

* Development
	* [LiveReload Extensions](http://help.livereload.com/kb/general-use/browser-extensions)

* Utilities
	* [HyperDock](https://bahoom.com/hyperdock/)
	* [Little Snitch](http://www.obdev.at/products/littlesnitch/download.html)

* Virtualization
	* Parallels Desktop (installed via Cask)
	* Docker (installed via brew)
	* Vagrant (installed via Cask)

Fonts
-----
[Mensch coding font](http://robey.lag.net/2010/06/21/mensch-font.html)

# Xcode Command Line Tools

`Xcode > Preferences > Downloads > Command Line Tools`


# Homebrew

## Install Parallels plugin for Vagrant
```
vagrant plugin install vagrant-parallels
```

See http://parallels.github.io/vagrant-parallels/ for more details.


# Shell

Install custom .dotfiles
```bash
git clone git@github.com:kevinelliott/.dotfiles.git ~/.dotfiles
~/.dotfiles/install.sh
```

Update .bash_profile
```bash
echo 'source ~/.dotfiles/base.sh' >> ~/.bash_profile
```

# OS X Preferences

```bash

#Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1

#Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 10

#Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

#Show the ~/Library folder
chflags nohidden ~/Library

#Store screenshots in subfolder on desktop
mkdir ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots
```

Set hostname
------------
`sudo scutil --set HostName SpaceX-Falcon-9`


#Git

Setup Github
------------
```bash
ssh-keygen -t rsa -C "kevin@welikeinc.com"

# Copy ssh key to github.com
subl ~/.ssh/id_rsa.pub

# Test connection
ssh -T git@github.com

# Set git config values
git config --global user.name "Kevin Elliott"
git config --global user.email "kevin@welikeinc.com"
git config --global github.user kevinelliott
git config --global github.token your_token_here

git config --global core.editor "subl -w"
git config --global color.ui true
```


# Sublime Text

Add Sublime Text CLI
--------------------

This is done automatically by Homebrew Cask.

Install Package Control
-----------------------

Run `Sublime Text 3` and access the console via the `CTRL + ``` shortcut or the `View > Show Console` menu.

```
import urllib.request,os,hashlib; h = '7183a2d3e96f11eeadd761d777e62404' + 'e330c659d4bb41d3bdf022e94cab3cd0'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://sublime.wbond.net/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```

See https://sublime.wbond.net/installation for more information. Their site has a note that this install code will change for each new release, so it would be good to check once in a while.

Install Packages
----------------
[BracketHighlighter](https://github.com/facelessuser/BracketHighlighter)
[CoffeeScriptHaml](https://github.com/jisaacks/CoffeeScriptHaml)


Install Soda Theme
----------------------
```bash
git clone git://github.com/buymeasoda/soda-theme.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Theme\ -\ Soda
```

Install Tomorrow Theme
----------------------
```bash
git clone git://github.com/chriskempson/textmate-tomorrow-theme.git ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Color\ Scheme\ -\ Tomorrow
```

Settings
--------

**Sublime Text > Preferences > Settings - User**

```json
{
  "bold_folder_labels": true,
  "close_windows_when_empty": true,
  "color_scheme": "Packages/User/SublimeLinter/Monokai-Cobalt (SL).tmTheme",
  "draw_indent_guides": false,
  "fade_fold_buttons": false,
  "font_face": "Source Code Pro",
  "font_size": 16,
  "highlight_line": true,
  "highlight_modified_tabs": true,
  "ignored_packages":
  [
    "Vintage"
  ],
  "show_tab_close_buttons": false,
  "spell_check": false,
  "tab_size": 2,
  "translate_tabs_to_spaces": true,
  "theme": "Soda Light.sublime-theme",
  "word_separators": "./\\()\"'-:,.;<>~!@#%^&*|+=[]{}`~?",
  "word_wrap": true
}
```

Key Bindings
------------

```json
[
	{ "keys": ["super+b"], "command": "expand_selection", "args": {"to": "brackets"} },
	{ "keys": ["super+f"], "command": "show_panel", "args": {"panel": "replace"} },
	{ "keys": ["super+alt+f"], "command": "show_panel", "args": {"panel": "find"} }
]
```


Snippets
--------
```bash
git clone git@github.com:bytestudios/sublime-snippets.git "/Users/Joel/Library/Application Support/Sublime Text 2/Packages/Byte"
```


## Server

### MySQL

```bash
brew install mysql
brew pin mysql
```

### MySQL Settings

```bash
# Copy launch agent into place
mkdir -p ~/Library/LaunchAgents && cp /usr/local/Cellar/mysql/VERSION/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/

# Edit launch agent and set both keepalive and launch at startup to false
vi ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

# Inject launch agent
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

# Set up databases to run as your user account
unset TMPDIR && mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp

# Start mysql
start mysql

# Secure mysql
/usr/local/Cellar/mysql/VERSION/bin/mysql_secure_installation
```


### PostgreSQL

```bash
brew install postgres --no-ossp-uuid
brew pin postgres
```

### PostgreSQL Settings

```bash
# Initialize db if none exists already
initdb /usr/local/var/postgres

# Create launchctl script
mkdir -p ~/Library/LaunchAgents
cp /usr/local/Cellar/postgresql/VERSION/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/

# Edit launchctl script (set to not start automatically and keepalive false)
subl ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# Inject launchctl script
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# Start PostgreSQL
start pg
```

### Ruby Gems

#### libv8 / therubyracer
```bash
brew uninstall v8
gem uninstall libv8
brew install v8
gem install therubyracer
gem install libv8 -v 3.16.14.3 -- --with-system-v8
```

#### nokogiri
```bash
brew tap homebrew/dupes
brew install libxml2 libxslt libiconv
gem install nokogiri -- --with-iconv-dir=/usr/local/Cellar/libiconv/VERSION/
```
