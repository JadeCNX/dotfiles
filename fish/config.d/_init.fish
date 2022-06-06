
#
# Key bind
#

bind \cd delete-char  # Don't exit on accidental Ctrl-D
bind \cd\cd\cd delete-or-exit  # Exit on the third one

#
# Browser
#
if test -z "$BROWSER"
  switch (uname)
  case Darwin
    set -gx BROWSER 'open'
  end
end


#
# Editors
#
if type -q lvim
  set -gx EDITOR lvim
else if type -q nvim
  set -gx EDITOR nvim
else
  set -gx EDITOR vim
end

set -gx VISUAL $EDITOR


#
# java
#
set JAVA_EXEC /usr/libexec/java_home
if test -e "$JAVA_EXEC"
  set -gx JAVA_HOME ($JAVA_EXEC)
end


#
# ruby
#
set RUBY_HOME "/usr/local/opt/ruby"
if test -e "$RUBY_HOME"
  set -gx GEM_HOME "$RUBY_HOME"
  fish_add_path -ga "$RUBY_HOME/bin"
  fish_add_path -ga "$GEM_HOME/{bin,gems/3.0.0/bin}"
end

#
# Android
#
if test -d "$HOME/Library/Android/sdk"
  set -gx ANDROID_HOME "$HOME/Library/Android/sdk"
  fish_add_path -ga "$ANDROID_HOME/{emulator,tools,tools/bin,platform-tools}"
end

#
# Golang
#
if type -q go
  set -gx GOPATH "$HOME/.go"
  fish_add_path -ga "$GOPATH/bin"
end



#
# Less
#
if test -z "$LESS"
  export LESS='-X -F -g -i -M -R -S -w -z-4 -x4'
end
