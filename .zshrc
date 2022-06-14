# set -o vi and mimic 'set backspace'
bindkey -v '^?' backward-delete-char

# fancy color prompt - https://jonasjacek.github.io/colors/
export PS1='%F{240}%n%F{94}@%F{130}%m%f %F{166}%1~ %f%# '

alias aws='docker run --rm -it --user 501:20 -v ~/.aws:/.aws:ro amazon/aws-cli:latest'
alias be='bundle exec'
alias dkc='docker compose'
alias gcloud='docker run --rm -it --user 501:20 -v ~/.gcp/config:/home/kenichi/.config -v ~/.gcp/kube:/home/kenichi/.kube -v ~/.gcp/ssh:/home/kenichi/.ssh --platform linux/amd64 kenichi/gcloud gcloud'
alias ls='ls -G'
# alias rlw='rlwrap --always-readline'
alias ts='tmux split-window -v -c `pwd`'
alias th='tmux split-window -h -c `pwd`'
alias tm='tmux rename-window $(basename `pwd`)'
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias tf='docker run --rm -it --user 501:20 --platform linux/amd64 -v `pwd`:/$(basename `pwd`):cached -v ${HOME}/.aws:/.aws:ro --workdir /$(basename `pwd`) hashicorp/terraform:latest'
alias dbt='docker run --rm -it --user 501:20 --platform linux/amd64 -v `pwd`:/$(basename `pwd`) -v ${HOME}/.dbt:/.dbt:ro --workdir /$(basename `pwd`) ghcr.io/dbt-labs/dbt-postgres:latest'
alias ssh-nohostkey='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

# get a shell on the linux vm
# hyperkit_docker_shell() {
#     screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty
# }
# alias hds=hyperkit_docker_shell

# export GOPATH=/Users/kenichi/src/go
# export PATH="/opt/homebrew/bin:$GOPATH/bin:$PATH"

export CFLAGS="-I/opt/homebrew/include"
export LDFLAGS="-L/opt/homebrew/lib"

# brew's ruby
export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.1.0/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"

# right side git
# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# RPROMPT=\$vcs_info_msg_0_
# zstyle ':vcs_info:git:*' formats '%F{240}%r (%b)%f'
# zstyle ':vcs_info:*' enable git

export EDITOR=`which vim`
export ERL_AFLAGS="-kernel shell_history enabled"
