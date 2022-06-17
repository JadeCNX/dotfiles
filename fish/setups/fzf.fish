#
# FZF
#

# Setup key binds fzf.fish (see also: fzf_configure_bindings --help)
fzf_configure_bindings --directory=\ct --git_log=\cg --git_status=\cs --history=\cr --variables=\cv

# Use ;; as the trigger sequence instead of the default **
set -gx FZF_COMPLETION_TRIGGER ';;'

# Options to fzf command
set -gx FZF_COMPLETION_OPTS '+c -x'

set -gx CHEAT_USE_FZF true

if test -z "$TMUX"
  set -gx FZF_TMUX 1
end

set -gx FZF_CTRL_T_OPTS "--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

function fzf_binds
  printf 'ctrl-v:execute(less -K {}),'
  printf 'ctrl-e:execute(${EDITOR:-vim} {}),'
  printf 'ctrl-u:execute-silent($copy < {}),'
  printf 'ctrl-y:execute-silent(echo {} | xargs echo -n | $copy),'
  printf 'ctrl-r:execute-silent(realpath {} | xargs echo -n | $copy)'
end

function fzf_color
  printf 'dark,'
  printf 'fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe,'
  printf 'info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef'
end

set -gx FZF_DEFAULT_OPTS "--bind $(fzf_binds) --color $(fzf_color)"

 

