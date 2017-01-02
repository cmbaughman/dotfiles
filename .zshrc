# Path to your oh-my-zsh installation.
export ZSH=/Users/cmbaughman/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# docker docker-compose
plugins=(adb ant atom bower brew brew-cask common-aliases composer cp extract gem git gnu-utils grunt gulp history meteor node npm nvm osx python rsync ssh-agent vagrant xcode zsh_reload)

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:${PATH}"
export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# SSH ssh-agent plugin config
zstyle :omz:plugins:ssh-agent agent-forwarding on
#zstyle :omz:plugins:ssh-agent identities put ids here
zstyle :omz:plugins:ssh-agent lifetime 24h

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='nano'
else
 export EDITOR='nano'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Completions
# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Completions
fpath=(/usr/local/share/zsh-completions $fpath)
#source /usr/local/share/zsh/site-functions/_aws
#autoload bashcompinit
#bashcompinit
#source ${HOME}/.composer/vendor/drush/drush/drush.complete.sh

# Python Virtual Environment Wrapper
source /usr/local/bin/virtualenvwrapper.sh

# Custom Vars
export ANDROID_HOME="${HOME}/Library/Android/sdk"
export JAVA_HOME="$(/usr/libexec/java_home)"
export ATLAS_TOKEN=""
export ANSIBLE_INVENTORY="~/ansible_hosts"
# More PATH stuff
export PATH="${PATH}:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools"
export PATH="${PATH}:${HOME}/.composer/vendor/bin"
export PATH="${PATH}:${HOME}/bin"

# Export variables for Docker Postgres
#export POSTGRES_PASSWORD=""
#export POSTGRES_USER=""

# Export variables for mailserver in apps
#export MAIL_USER=""
#export MAIL_PASS=""

# ssh
## TODO: ADD THE gpg-agent stuff and mac specific fix for El Capitan and Sierra HERE

# NVM
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# NODE ENV
export NODE_ENV='dev'

# RBENV
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# RBENV-GEM-REHASH needs GEM_PATH variable
export GEM_PATH="$(gem env gempath)"

# Stuff for Drupal Dev Desktop 2
export PHP_ID=php5_5
#export PATH="/Applications/DevDesktop/$PHP_ID/bin:/Applications/DevDesktop/mysql/bin:/Applications/DevDesktop/drush:$PATH"

# Command Line App "Cheat"
export CHEATPATH='${HOME}/.cheat'
export CHEATCOLORS=true

# Raise the number of open file handles to increase concurrent connections (for Ansible SSH)
# sudo launchctl limix maxfiles unlimited

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="atom ~/.zshrc"
alias ohmyzsh="atom ~/.oh-my-zsh"
alias sshconfig="atom ~/.ssh/config"
alias chrome='open -a "Google Chrome"'
alias sublime='open -a "Sublime Text"'
alias atom='open -a "Atom"'
alias attach="hdiutil attach"
alias preview="qlmanage -p"
alias listen="lsof -i TCP -n -P | grep LISTEN"
alias path="echo ${PATH//:/$'\n'}"
alias myip="curl -4 icanhazip.com"

# Make dir and cd to it
function mcd() {
  mkdir -p "$1" && cd "$1";
}
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
# List outdated pip packages
function pip-old() {
  pip list --outdated --allow-external vboxapi
}
# Update ALL pip packages
function update-pip() {
  pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
}
# Push to ALL remotes and include tags
function gpt() {
  for r in $(git remote); do
    if [ -z "$1" ]; then
      git push $r master --follow-tags;
    else
      git push $r $1 --follow-tags;
    fi
  done
}
# Update ALL rubygems (FIRST install rubygems-update w/ gem install rubygems-update)
alias gem-update="update_rubygems && gem update --system && gem update"
alias ldir="ls -ld */"
alias lsplugins="ls ~/.oh-my-zsh/plugins"
alias listening="sudo lsof -i -P | grep -i 'listen'"
alias bcu="brew update && brew cask update"
alias balls='brew update && brew cask update && brew outdated && brew upgrade && brew cleanup'
#alias docker-cleanup="docker rm $(docker ps -a -q) && docker rmi $(docker images -q)"
#alias docker-machine-config='eval "$(docker-machine env default)"'
alias show-files='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide-files='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias git-cmds="alias|grep 'git'"
# Find ALL global outdated npm modules
alias npmo="npm outdated -g --parseable --depth=0"
# Update ALL global npm modules
alias npmu="npm update -g"
# Refresh .gitignore
alias gi-refresh="git ls-files --ignored --exclude-standard | xargs git rm --cached"
# Open All Chrome Tabs With DevTools already open
alias chrome-debug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --auto-open-devtools-for-tabs"
# Add workprofile to git
git config --global alias.workprofile 'config user.email "chris@work.dev"'
#From then on just run git workprofile to activate.

# function tags the last commit with arg
function gtop() {
  CMT=$(git log | head -n 1 | cut -d' ' -f2);
  g tag $@ $CMT ;
}
# .gitignore Gitignore.io
function gi() {
    curl -L -s https://www.gitignore.io/api/$@ ;
}
# The githelper functions below taken from https://github.com/chrishunt/dot-files/blob/master/.githelpers
function delete_local_merged_branches() {
  git branch --merged master | grep -v master | xargs git branch -d
}

function delete_remote_merged_branches() {
  git fetch origin
  git remote prune origin

  for BRANCH in `git branch -r --merged origin/master |\
                 egrep "^\s*origin/"                  |\
                 grep -v master                       |\
                 grep chrishunt                       |\
                 cut -d/ -f2-`
  do
    git push origin :$BRANCH
  done
}

function weekly_summary() {
  LAST_WEEK=$(date -v-7d +%m/%d)
  STATS=$(
    git log --since=1.week --oneline |
    tail -n 1                        |
    awk '{ print $1 }'               |
    xargs git diff --shortstat
  )
  FEATURES=$(
    git log --since=1.week --oneline |
    egrep "Merge (pull|branch) "
  )
  FEATURES_COUNT=$(
    echo "$FEATURES" |
    sed '/^\s*$/d'   |
    wc -l            |
    awk '{ print $1 }'
  )

  echo "Stats ($LAST_WEEK - Today)"
  echo "---------------------"
  echo "$STATS"
  echo
  echo "Features ($FEATURES_COUNT)"
  echo "-------------"
  echo "$FEATURES"
}
