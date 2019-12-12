#!/bin/bash

# dotfile root
cd ..

dotfilesDir=$(pwd)

function linkDotfile {
  dest="${HOME}/.${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${dest}"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

linkDotfile vimrc
linkDotfile tmux.conf
linkDotfile bashrc
#linkDotfile bash_profile
#linkDotfile .gitconfig
linkDotfile zshrc
linkDotfile profile

mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]
then
  echo "Install Vundle.vim..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  echo "Launch vim and run :PluginInstall"
fi
