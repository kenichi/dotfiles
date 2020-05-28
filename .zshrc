# set -o vi and mimic 'set backspace'
bindkey -v '^?' backward-delete-char

# fancy color prompt - https://jonasjacek.github.io/colors/
export PS1='%F{240}%n%F{94}@%F{130}%m%f %F{166}%1~ %f%# '

alias be='bundle exec'
alias dkc=docker-compose
alias ls='ls -G'
alias rlw='rlwrap --always-readline'
alias ts='tmux split-window -v -c `pwd`'
alias tm='tmux rename-window $(basename `pwd`)'

# get a shell on the linux vm
hyperkit_docker_shell() {
    screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty
}
alias hds=hyperkit_docker_shell

# brew's ruby
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export LDFLAGS="-L/usr/local/opt/ruby/lib"

# right side git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}%r (%b)%f'
zstyle ':vcs_info:*' enable git
