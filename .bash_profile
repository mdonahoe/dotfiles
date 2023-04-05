# highlight different files
source ~/.bashrc
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Erase duplicates
export HISTCONTROL=erasedups
export FIGNORE=$FIGNORE:.pyc

# Neovim
export EDITOR='nvim'

export PATH=~/aircam/:$PATH
export HTTP_HOST='localhost'

# Don't let python create .pyc files
export PYTHONDONTWRITEBYTECODE=1

# MacPorts Bash shell command completion
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`


# Shortcut for cloning github repos with `clone username/repo` syntax
clone ()
{
    git clone git@github.com:${1}.git;
}

# Repeat a command until it succeeds!
# Useful for editing unit tests, or re-running a flaky upload command.
hammer ()
{
    until ($@); do
           sleep 1
    done
}

# The reverse of hammer: re-run a command until it fails
# Useful for testing unreliable commands.
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
# Note: This often gets confused by merge commits
alias gl='git log origin/master... --oneline --no-merges'

# add changes and commit
alias gap="git add -p; git commit"

# Sort local and remote branches by git author and recency
alias whogit="git for-each-ref --format='%(authoremail) %09 %(refname)' --sort=committerdate"

# Filter the above command by the current git user
alias mygit="whogit | grep `git config --get user.email`"

# Find all the merged branches and sort by author.
alias mergedgit="git for-each-ref --merged origin/master --format='%(authoremail) %09 %(refname:short)' --sort=committerdate --sort=committeremail refs/remotes/"

# Show git branch and dirty state in the command prompt
# source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
# source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
PS1='$(__git_ps1 "%s")\[${c_sgr0}\]:\[${c_cyan}\]\W\[${c_sgr0}\]$ '

# Load custom directory shortcuts
source ~/cd_shorties.sh

# Serve the files in the current directory at localhost:8000
alias serve="python -m SimpleHTTPServer"

# todo
alias todo='nvim ~/chrono/todo.txt'

# Open the current directory in Linux's finder
alias here="nautilus ."

# Offer to install missing commands on linux.
export COMMAND_NOT_FOUND_INSTALL_PROMPT=1

# Increase command-line history tracking.
export HISTSIZE=1000000
export HISTFILESIZE=1000000000

# This caused problems with tmux HOME/END
# export TERM=xterm-256color
# See https://stackoverflow.com/a/18601007/53997
# Recommendation was to use screen-256color instead of xterm
export TERM=screen-256color

# Create a reverse ssh tunnel `reverse_tunnel username@example.com`
# You can then gain access to the original machine via the public server.
# Log in to username@example.com from another machine and do `ssh username@localhost:19999`
alias reverse_tunnel="ssh -R 19998:localhost:22"

# export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/aircam/build/host_aircam/bin:$PATH"
export CLOUD_CLIENT_EMAIL=matt@skydio.com

# Alias for Yubikey pin prompt
alias yubact="ssh-add -D && ssh-add -e /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so; ssh-add -s /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so"
if [ -e /home/matt/.nix-profile/etc/profile.d/nix.sh ]; then . /home/matt/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Temp hack to fix java install
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
