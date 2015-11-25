# highlight different files
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Erase duplicates
export HISTCONTROL=erasedups
export FIGNORE=$FIGNORE:.pyc

export EDITOR='vim'

# homebrew told me to do this (local/bin before usr/bin)
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/python:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:~/Documents:$PATH
export PATH=~/bin/:$PATH

export HTTP_HOST='localhost'
export PYTHONDONTWRITEBYTECODE=1

# MacPorts Bash shell command completion
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`



clone ()
{
    git clone git@github.com:${1}.git;
}

hammer ()
{
    WAIT_TIME=1
    until ($@); do
           sleep $(( WAIT_TIME ))
    done
}

crowbar ()
{
    while ($@); do
        :  # no-op
    done
}

##GIT ALIASES
alias gss="git submodule status"
alias gcp="git cherry-pick"
alias gsur="git submodule update --init --recursive"
# lists commits between local branch and its origin copy
alias glo='git log $(git merge-base origin/$(parse_git_branch) HEAD)^.. --oneline'
# reset master to origin master
alias remaster="git reset --hard origin/master"


# Basic shortcuts
alias gs="git status"
alias gc="git checkout"
alias gd="git diff --color"

# Lists commits between local branch and origin/master
# Note: this will be tricked by merge commits
alias gl='git log origin/master.. --oneline --no-merges'

# add changes and commit
alias gap="git add -p; git commit"

# Show me all my branches, locally and remote
alias mygit="git for-each-ref --format='%(authoremail) %09 %(refname)' --sort=committerdate | grep `git config --get user.email`"

# Opens gitk in the background so it doesnt consume the terminal
alias gk="gitk --all > /dev/null 2>&1&"

# show git branch and dirty state in the command prompt
GIT_PS1_SHOWDIRTYSTATE=1
PS1='$(__git_ps1 "%s")\[${c_sgr0}\]:\[${c_cyan}\]\W\[${c_sgr0}\]$ '

# cd shortcuts
source ~/cd_shorties.sh

# my scripts
alias serve="python -m SimpleHTTPServer"


# todo
alias todo='vim ~/chrono/todo.txt'

# notes
alias notes='vim ~/Dropbox/notes'

# photo editing
alias pixel='open -a Pixelmator'

# hosts file
alias hosts='sudo vim /etc/hosts'

# editing this file
alias vbp="vim ~/.bash_profile"
alias sbp="source ~/.bash_profile"

alias ql="qlmanage -p &>/dev/null"
alias sl="ls"

alias sandbox="ssh dho@serioussandbox.com"
alias authorizer="cat ~/.ssh/id_rsa.pub | ssh dho@serioussandbox.com 'cat >> .ssh/authorized_keys'"

alias disable_main_keyboard="sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/"
alias enable_main_keyboard="sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/"


alias here="nautilus ."
#alias ls='ls --color=tty' 2>/dev/null

# web browser!
web(){
    google-chrome $1
}

ding() {
    echo "ding $@"
    $@
    ssh matt@matts-imac "say $@ complete"
}

# export OSG_DIR=~/osg/
# export OSG_LIBRARY_PATH=~/osg/build/lib/
# export OSG_FILE_PATH=~/Downloads/OpenSceneGraph-Data-3.0.0:~/OpenSceneGraph-Data-3.0.0/Images
# export NDK=~/Downloads/android-ndk-r10d/


export COMMAND_NOT_FOUND_INSTALL_PROMPT=1
