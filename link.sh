# symlink dotfiles in the user directory
this_directory="$(pwd)"
cd ~
ln -s $this_directory/.bash_profile .
ln -s $this_directory/nvim .config/nvim
