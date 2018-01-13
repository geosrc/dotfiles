#!/bin/bash

# Configuration
dir=~/dotfiles        # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc zshrc profile tmux.conf"    # list of files/folders to symlink in homedir

# Create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

cd $dir

# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
   echo "Moving any existing dotfiles from ~ to $olddir"
   mv ~/.$file $olddir
   echo "Creating symlink to $file in home directory."
   ln -s $dir/$file ~/.$file
done

mkdir -p ~/.vim/autoload ~/.vim/bundle
if [ ! -e ~/.vim/autoload/pathogen.vim ]
then
  echo "Install pathogen.vim..."
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

if [ ! -d ~/.vim/bundle/vim-sensible ]
then
  echo "Install vim-sensible..."
  cd ~/.vim/bundle
  git clone git://github.com/tpope/vim-sensible.git
fi