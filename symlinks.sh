#!/bin/sh

# backup
mv -iv ~/.alacritty.yml ~/.alacritty.yml.old
mv -iv ~/.gitignore_global ~/.gitignore_global.old
mv -iv ~/.hyper.js ~/.hyper.js.old
mv -iv ~/.spacemacs.d ~/.spacemacs.d.old
mv -iv ~/.tmux.conf ~/.tmux.conf.old
mv -iv ~/.vimrc ~/.vimrc.old
mv -iv ~/.config/nvim ~/.config/nvim.old
mv -iv ~/.vrapperrc ~/.vrapperrc.old
mv -iv ~/.w3m ~/.w3m.old
mv -iv ~/.xvimrc ~/.xvimrc.old
mv -iv ~/.zlogin ~/.zlogin.old
mv -iv ~/.zlogout ~/.zlogout.old
mv -iv ~/.zpreztorc ~/.zpreztorc.old
mv -iv ~/.zprofile ~/.zprofile.old
mv -iv ~/.zshenv ~/.zshenv.old
mv -iv ~/.zshrc ~/.zshrc.old

# alacritty
ln -sfnv "$PWD/alacritty.yml" ~/.alacritty.yml

# git
ln -sfnv "$PWD/gitignore_global" ~/.gitignore_global

# hyper
ln -sfnv "$PWD/hyper.js" ~/.hyper.js

# emacs
ln -sfnv "$PWD/spacemacs.d" ~/.spacemacs.d

# tmux
ln -sfnv "$PWD/tmux.conf" ~/.tmux.conf

# eclipse - vrapper
ln -sfnv "$PWD/vrapperrc" ~/.vrapperrc

# xcode - xvim2
ln -sfnv "$PWD/xvimrc" ~/.xvimrc

# vim
mkdir -p "$PWD/.config"
ln -sfnv "$PWD/vimrcs/config_nvim" ~/.config/nvim
ln -sfnv "$PWD/vimrcs/vimrc.vim" ~/.vimrc

# zprezto
ln -sfnv "$PWD/zprezto/zlogin" ~/.zlogin
ln -sfnv "$PWD/zprezto/zlogout" ~/.zlogout
ln -sfnv "$PWD/zprezto/zpreztorc" ~/.zpreztorc
ln -sfnv "$PWD/zprezto/zprofile" ~/.zprofile
ln -sfnv "$PWD/zprezto/zshenv" ~/.zshenv
ln -sfnv "$PWD/zprezto/zshrc" ~/.zshrc
