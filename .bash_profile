NODE_BIN_PATH=/usr/local/opt/node@8/bin
PYTHON_BIN_PATH=/Users/kenichi/Library/Python/3.7/bin

PATH=$PATH:$NODE_BIN_PATH:$PYTHON_BIN_PATH
PS1='\[\033[00;35m\]\h\[\033[00m\]:\[\033[00;34m\]\W \[\033[01;34m\]\$\[\033[00m\] '

export PATH PS1 

alias dkc='docker-compose'
alias ls='ls -G'

alias ts='tmux split-window -v -c `pwd`'
alias tm='tmux rename-window $(basename `pwd`)'

source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby 2.6.1
