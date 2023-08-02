# set -o vi and mimic 'set backspace'
bindkey -v '^?' backward-delete-char

# fancy color prompt - https://jonasjacek.github.io/colors/
export PS1='%F{240}%n%F{94}@%F{130}%m%f %F{166}%1~ %f%# '

# lil more history
export HISTSIZE=9999
export SAVEHIST=$HISTSIZE

# alias aws='docker run --rm -it --user 501:20 -v ~/.aws:/.aws:ro amazon/aws-cli:latest'
alias be='bundle exec'
alias dkc='docker compose'
alias dkcs='docker compose -f docker/clickhouse-setup/docker-compose.yaml'
alias ls='ls -G'
# alias rlw='rlwrap --always-readline'
alias ts='tmux split-window -v -c `pwd`'
alias th='tmux split-window -h -c `pwd`'
alias tm='tmux rename-window $(basename `pwd`)'
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias ssh-nohostkey='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias scp-nohostkey='scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

# get a shell on the linux vm
# hyperkit_docker_shell() {
#     screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty
# }
# alias hds=hyperkit_docker_shell

# export GOPATH=/Users/kenichi/src/go
# export PATH="/opt/homebrew/bin:$GOPATH/bin:$PATH"

# export CFLAGS="-I/opt/homebrew/include"
# export LDFLAGS="-L/opt/homebrew/lib"

# brew's erlang upped to 26, 25 is cask-only
# export PATH="/opt/homebrew/opt/erlang@25/bin:$PATH"

# brew's ruby
export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.2.0/bin:$PATH"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/ruby/include"
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/ruby/lib"

# right side git
# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# RPROMPT=\$vcs_info_msg_0_
# zstyle ':vcs_info:git:*' formats '%F{240}%r (%b)%f'
# zstyle ':vcs_info:*' enable git

export EDITOR=`which nvim`
export ERL_AFLAGS="-kernel shell_history enabled"

# asdf
function load_asdf {
  export CFLAGS="$CFLAGS -O2 -g -I/opt/homebrew/opt/openssl@1.1/include -I/opt/homebrew/opt/zlib/include"
  export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/openssl@1.1/lib -L/opt/homebrew/opt/zlib/lib"
  export HOMEBREW_PREFIX=/opt/homebrew
  export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig"
  . /opt/homebrew/opt/asdf/libexec/asdf.sh
}

# direnv
function load_direnv {
  eval "$(direnv hook zsh)"
}

# 1pass op aws
OP_PLUGINS=$HOME/.config/op/plugins.sh
if [ -e "${OP_PLUGINS}" ]; then
  source "${OP_PLUGINS}"
  function load_op {
    export AWS_ACCESS_KEY_ID="op://Private/AWS kenichi/access key id"
    export AWS_SECRET_ACCESS_KEY="op://Private/AWS kenichi/secret access key"
    export AWS_DEFAULT_REGION="op://Private/AWS kenichi/default region"
  }
else
  echo "no 1password plugins found" >&2
fi
