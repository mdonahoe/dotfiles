# highlight different files
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Erase duplicates
export HISTCONTROL=erasedups
export FIGNORE=$FIGNORE:.pyc

export EDITOR='nvim'

export PATH=~/aircam/:$PATH
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
alias whogit="git for-each-ref --format='%(authoremail) %09 %(refname)' --sort=committerdate"
alias mygit="whogit | grep `git config --get user.email`"
alias mergedgit="git for-each-ref --merged origin/master --format='%(authoremail) %09 %(refname:short)' --sort=committerdate --sort=committeremail refs/remotes/"

# Opens gitk in the background so it doesnt consume the terminal
alias gk="gitk --all > /dev/null 2>&1&"

# show git branch and dirty state in the command prompt
# source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
# source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
PS1='$(__git_ps1 "%s")\[${c_sgr0}\]:\[${c_cyan}\]\W\[${c_sgr0}\]$ '

# cd shortcuts
source ~/cd_shorties.sh

# my scripts
alias serve="python -m SimpleHTTPServer"

# todo
alias todo='nvim ~/chrono/todo.txt'

alias ql="qlmanage -p &>/dev/null"
alias sl="ls"

alias here="nautilus ."

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
# eval "$(register-python-argcomplete launch_pipeline)"
# eval "$(register-python-argcomplete skyrun)"
export HISTSIZE=1000000
export HISTFILESIZE=1000000000

# This caused problems with tmux HOME/END
# export TERM=xterm-256color
# See https://stackoverflow.com/a/18601007/53997
# Recommendation was to use screen-256color instead of xterm
export TERM=screen-256color

alias reverse_tunnel="ssh -R 19999:localhost:22"

# export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/aircam/build/host_aircam/bin:$PATH"
