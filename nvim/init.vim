set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" inccommand shows you in realtime what changes your ex command should make
set inccommand=split

" true color enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

source ~/.vimrc

if g:neovim_builtin_feature_enable
	lua require("init")
endif
