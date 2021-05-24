set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" inccommand shows you in realtime what changes your ex command should make
set inccommand=split

" true color enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

source ~/.vimrc

if has('nvim-0.5')
	lua require("init")
endif
