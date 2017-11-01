# highlight different files
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Erase duplicates
export HISTCONTROL=erasedups
export FIGNORE=$FIGNORE:.pyc

export EDITOR='nvim'

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
    until ($@); do
           sleep 1
    done
}

crowbar ()
{
    while ($@); do
        :  # no-op
    done
}

# Basic shortcuts
alias gs="git status"
alias gc="git checkout"
alias gd="git diff --color"

# Lists commits between local branch and origin/master
# Note: this will be tricked by merge commits
alias gl='git log origin/master... --oneline --no-merges'

# add changes and commit
alias gap="git add -p; git commit"
alias gapa="git add -p; git commit --amend --no-edit"

# Show me all my branches, locally and remote
alias mygit="git for-each-ref --format='%(authoremail) %09 %(refname)' --sort=committerdate | grep `git config --get user.email`"
alias whogit="git for-each-ref --format='%(authoremail) %09 %(refname)' --sort=committerdate"

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
alias todo='nvim ~/chrono/todo.txt'

# notes
alias notes='nvim ~/Dropbox/notes'

# photo editing
alias pixel='open -a Pixelmator'

# hosts file
alias hosts='sudo nvim /etc/hosts'

# editing this file
alias vbp="nvim ~/.bash_profile"
alias sbp="source ~/.bash_profile"

alias ql="qlmanage -p &>/dev/null"
alias sl="ls"

alias sandbox="ssh dho@serioussandbox.com"
alias authorizer="cat ~/.ssh/id_rsa.pub | ssh dho@serioussandbox.com 'cat >> .ssh/authorized_keys'"

alias disable_main_keyboard="sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/"
alias enable_main_keyboard="sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/"

alias synergize="/usr/bin/synergyc -f --no-tray --debug NOTE --name kursk matts-imac.local:24800"


alias here="nautilus ."
#alias ls='ls --color=tty' 2>/dev/null

# Show the status of the current git repo and cd to its root. Fail if not in a repo.
alias cg="git status && cd \`git rev-parse --show-toplevel\`"

# web browser!
web(){
    google-chrome $1
}

ding() {
    echo "ding $@"
    $@
    ssh matt@matts-imac "say $@ complete"
}

export COMMAND_NOT_FOUND_INSTALL_PROMPT=1
eval "$(register-python-argcomplete launch_pipeline)"
eval "$(register-python-argcomplete skyrun)"
export HISTSIZE=1000000
export HISTFILESIZE=1000000000

export TERM=xterm-256color
export PATH="$HOME/.cargo/bin:$PATH"
