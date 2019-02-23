NODE_BIN_PATH=/usr/local/opt/node@8/bin
PYTHON_BIN_PATH=/Users/kenichi/Library/Python/3.7/bin

PATH=$PATH:$NODE_BIN_PATH:$PYTHON_BIN_PATH
PS1='\[\033[00;35m\]\h\[\033[00m\]:\[\033[00;34m\]\W \[\033[01;34m\]\$\[\033[00m\] '

export PATH PS1 

alias dkc='docker-compose'
alias ls='ls -G'

alias ts='tmux split-window -v -c `pwd`'
alias tm='tmux rename-window $(basename `pwd`)'

alias api='tmux neww -n api -c ~/src/phylos/api'
alias bas='tmux neww -n bastion ssh bastion'
alias lan='tmux neww -n landing -c ~/src/phylos/landing'
alias ops='tmux neww -n ops -c ~/src/phylos/ops'
alias sim='tmux neww -n sims -c ~/src/phylos/sims'

sims_exec() {
    pushd ~/src/phylos/ops/phylosbio.test
    dkc exec sims_php_cli /bin/bash -c "$*"
    popd
}

sims_psql() {
    pushd ~/src/phylos/ops/phylosbio.test
    dkc exec --user=postgres postgres psql phylos
    popd
}

alias se=sims_exec
alias sp=sims_psql

source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby 2.6.1
