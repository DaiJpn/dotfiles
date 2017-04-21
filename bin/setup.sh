#!/bin/bash

dotfiles=( vim vimrc zshenv zshrc tmux.conf tmux vimshrc bashrc gitconfig agignore vimperatorrc vimperator)
for file in ${dotfiles[@]}
do
  if [ -a $HOME/.$file ]; then
    echo ".$file already exists."
  else
    ln -s $HOME/dotfiles/$file $HOME/.$file
    echo "success to create symlink .$file"
  fi
done

cd $HOME/dotfiles
git submodule update --init

curl -sL --proto-redir -all,https https://zplug.sh/installer | zsh
