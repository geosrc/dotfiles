#!/usr/bin/env bash

set -Eeuo pipefail
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "Script directory: $script_dir"

function linkDotfile {
  dest="${HOME}/.${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h "${dest}" ]; then
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

  echo "Creating new symlink: ${dest} -> ${script_dir}/${1}"
  # This script is expected to be in the dotfiles directory
  ln -s ${script_dir}/${1} ${dest}
}

# bash
linkDotfile profile
linkDotfile bashrc

# zsh
linkDotfile zshenv
linkDotfile zprofile
linkDotfile zshrc

linkDotfile vimrc
linkDotfile tmux.conf
#linkDotfile bash_profile
#linkDotfile .gitconfig

mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]
then
  echo "Install Vundle.vim..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  echo "Launch vim and run :PluginInstall"
fi
