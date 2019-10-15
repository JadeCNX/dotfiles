#!/bin/sh

# alacritty
mv -iv ~/.alacritty.yml{,.old}
ln -sfnv "$PWD/alacritty.yml" ~/.alacritty.yml

# git
mv -iv ~/.gitignore_global{,.old}
ln -sfnv "$PWD/gitignore_global" ~/.gitignore_global

# hyper
mv -iv ~/.hyper.js{,.old}
ln -sfnv "$PWD/hyper.js" ~/.hyper.js

# emacs
mv -iv ~/.spacemacs.d ~/.{,.old}
ln -sfnv "$PWD/spacemacs.d" ~/.spacemacs.d

# tmux
ln -sfnv "$PWD/tmux.conf" ~/.tmux.conf

# eclipse - vrapper
mv -iv ~/.vrapperrc{,.old}
ln -sfnv "$PWD/vrapperrc" ~/.vrapperrc

# w3m
mv -iv ~/.w3m{,.old}
ln -sfnv "$PWD/w3m/w3m_config" ~/.w3m/config
ln -sfnv "$PWD/w3m/w3m_keymap" ~/.w3m/keymap

# xcode - xvim2
mv -iv ~/.xvimrc{,.old}
ln -sfnv "$PWD/xvimrc" ~/.xvimrc

# vim
mv -iv ~/.tmux.conf{,.old}
mv -iv ~/.config/nvim{,.old}

mkdir -p "$PWD/.config"
ln -sfnv "$PWD/vimrcs/config_nvim" ~/.config/nvim
ln -sfnv "$PWD/vimrcs/vimrc.vim" ~/.vimrc

# zprezto
mv -iv ~/.zlogin{,.old}
mv -iv ~/.zlogout{,.old}
mv -iv ~/.zpreztorc{,.old}
mv -iv ~/.zprofile{,.old}
mv -iv ~/.zshenv{,.old}
mv -iv ~/.zshrc{,.old}

ln -sfnv "$PWD/zprezto/zlogin" ~/.zlogin
ln -sfnv "$PWD/zprezto/zlogout" ~/.zlogout
ln -sfnv "$PWD/zprezto/zpreztorc" ~/.zpreztorc
ln -sfnv "$PWD/zprezto/zprofile" ~/.zprofile
ln -sfnv "$PWD/zprezto/zshenv" ~/.zshenv
ln -sfnv "$PWD/zprezto/zshrc" ~/.zshrc
