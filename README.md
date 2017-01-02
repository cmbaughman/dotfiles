# CMB Dotfiles

[![Build Status](https://travis-ci.org/cmbaughman/dotfiles.svg)](https://travis-ci.org/cmbaughman/dotfiles)

My configuration for development, mostly on Mac OSX but some of these can easily be used on Linux, especially anything zshell specific. I use robbyrussell's [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh) for the base of my zshell configuration.

## Getting Started

### Install Prerequisites

1. First allow the `init.sh` script to be executed with:
```
chmod a+x init.sh
```

2. Edit the script filling in the sections `EMAIL='your@email.here'` and `PASS='your_password'` with your actual email address and password used with the **Mac App Store**. This is only needed the first time you run the script and can be removed afterward.

3. Then, just run the script:
```
./init.sh
```

The `init.sh` script will take care of the prerequisites

#### Xcode Command Line Tools

During install of Homebrew, the script will kindly detect that you have not yet installed Xcode Command Line Tools, and pop up a dialog asking if you want to install it. Yes, you do. I defer to install the full Xcode until later since the download takes longer and I want to keep moving forward. For now, just the Xcode Command Line Tools.

Confirm the license:

`sudo xcodebuild -license`

### Install binaries from a Brewfile (apps from App Store using mas, apps from Cask)

#### Edit Brewfile for last minute changes

You may wish to add or remove a few App Store or Cask items before initiating Homebrew to install all of the applications. If you wish to review these now you may examine the [Brewfile](https://github.com/cmbaughman/dotfiles/Brewfile) now.

#### Manually Installing apps

`brew bundle install`

This will take some time, especially if you have a slow internet connection and because Xcode is huge. **But it's faster than you having to search the App Store app and click to install for each of these!**

### Installs from Third-Party Websites

* Development
	* [LiveReload Extensions](http://help.livereload.com/kb/general-use/browser-extensions)

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
git clone git@github.com:cmbaughman/.dotfiles.git ~/.dotfiles
~/.dotfiles/init.sh
```

# Git

Manually Seting Up Github
-------------------------
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

## Server Stuff

### MySQL

```bash
brew install mysql
brew pin mysql
```

### MySQL Settings

```bash
# Copy launch agent into place
mkdir -p ~/Library/LaunchAgents && ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents/

# Edit launch agent and set both keepalive and launch at startup to false
nano ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

# Inject launch agent
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

# Set up databases to run as your user account
unset TMPDIR && mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp

# Start mysql
start mysql

# Secure mysql
/usr/local/opt/mysql/bin/mysql_secure_installation
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

**NOTE**: You can test with either the travis-ci scripts, or clone a copy of [macos-virtualbox-vm](https://github.com/geerlingguy/macos-virtualbox-vm) by Jeff Geerling.
