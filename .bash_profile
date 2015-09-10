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
GIT_PS1_SHOWDIRTYSTATE=1
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

parse_git_branch ()
{
  if git rev-parse --git-dir --no-color >/dev/null 2>&1
  then
          gitver="$(git branch --no-color 2>/dev/null| sed -n '/^\*/s/^\* //p')"
  else
          return 0
  fi
  echo -e $gitver
}

branch_color ()
{
        if git rev-parse --git-dir >/dev/null 2>&1
        then
                color=""
                if git diff --quiet 2>/dev/null >&2
                then
                        color="${c_green}"
                else
                        color=${c_red}
                fi
        else
                return 0
        fi
        echo -ne $color
}

PS1='$(__git_ps1 "%s")\[${c_sgr0}\]:\[${c_cyan}\]\W\[${c_sgr0}\]$ '

##GIT ALIASES
alias gs="git status"
alias gss="git submodule status"
alias gc="git checkout"
alias gcp="git cherry-pick"
alias gd="git diff --color"
alias gsur="git submodule update --init --recursive"
# lists commits between local branch and origin/master
alias gl='git log $(git merge-base origin/master HEAD)^.. --oneline'
# lists commits between local branch and its origin copy
alias glo='git log $(git merge-base origin/$(parse_git_branch) HEAD)^.. --oneline'
# opens gitk in the background so it doesnt consume the terminal
alias gk="gitk --all > /dev/null 2>&1&"
# reset master to origin master
alias remaster="git reset --hard origin/master"

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

alias gap="git add -p; git commit"

alias sandbox="ssh dho@serioussandbox.com"
alias authorizer="cat ~/.ssh/id_rsa.pub | ssh dho@serioussandbox.com 'cat >> .ssh/authorized_keys'"

alias disable_main_keyboard="sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/"
alias enable_main_keyboard="sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/"


alias here="nautilus ."
#alias ls='ls --color=tty' 2>/dev/null

# git completion ( from http://code-worrier.com/blog/autocomplete-git/ )
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# web browser!
web(){
    google-chrome $1
}

ding() {
    echo "ding $@"
    $@
    ssh matt@matts-imac "say $@ complete"
}

alias mygit="git for-each-ref --format='%(authoremail) %09 %(refname)' --sort=committerdate | grep `git config --get user.email`"

alias skyrev="~/aircam/build/bin/skyrev_client"

# AWS Keys
# export OSG_DIR=~/osg/
# export OSG_LIBRARY_PATH=~/osg/build/lib/
# export OSG_FILE_PATH=~/Downloads/OpenSceneGraph-Data-3.0.0:~/OpenSceneGraph-Data-3.0.0/Images
# export NDK=~/Downloads/android-ndk-r10d/
