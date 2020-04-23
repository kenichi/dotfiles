GOPATH=/Users/kenichi/src/go
NODE_BIN_PATH=/usr/local/opt/node@10/bin
POSTGRES_BIN_PATH=/usr/local/opt/postgresql@9.6/bin
PYTHON_BIN_PATH=/Users/kenichi/Library/Python/3.7/bin
for p in $GOPATH/bin $NODE_BIN_PATH $POSTGRES_BIN_PATH $PYTHON_BIN_PATH; do
    echo $PATH | grep $p 2>&1 1>/dev/null
    if [ $? -ne 0 ]; then
        PATH=$PATH:$p
    fi
done
PS1='\[\033[00;35m\]\h\[\033[00m\]:\[\033[00;34m\]\W \[\033[01;34m\]\$\[\033[00m\] '
BASH_SILENCE_DEPRECATION_WARNING=1

export BASH_SILENCE_DEPRECATION_WARNING ECR GOPATH PATH PS1 

alias be='bundle exec'
alias dkc='docker-compose'
alias ls='ls -G'

alias ts='tmux split-window -v -c `pwd`'
alias tm='tmux rename-window $(basename `pwd`)'

alias rlw='rlwrap --always-readline'

hyperv_docker_shell() {
    screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty
}

alias hds=hyperv_docker_shell
