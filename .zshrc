# set -o vi and mimic 'set backspace'
bindkey -v '^?' backward-delete-char

# fancy color prompt - https://jonasjacek.github.io/colors/
export PS1='%F{240}%n%F{94}@%F{130}%m%f %F{166}%1~ %f%# '

# lil more history
export HISTSIZE=9999
export SAVEHIST=$HISTSIZE

alias dkc='docker compose'
alias ls='ls -G'
alias rlw='rlwrap --always-readline'
alias ssh-nohostkey='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias scp-nohostkey='scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

alias ts='tmux split-window -v -c `pwd`'
alias th='tmux split-window -h -c `pwd`'
alias tm='tmux rename-window $(basename `pwd`)'

if [ `uname` = "Darwin" ]; then
  alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
fi

# tell zsh path has unique values
typeset -U path PATH

export ASDF_DATA_DIR="$HOME/.asdf"
export GOPATH=/Users/kenichi/src/go
export GCLOUD_SDK_PATH=$HOME/src/tools/google-cloud-sdk/bin
export PATH="$ASDF_DATA_DIR/shims:/opt/homebrew/bin:$GOPATH/bin:$HOME/bin:$PATH:$GCLOUD_SDK_PATH"
export EDITOR=`which nvim`
export ERL_AFLAGS="-kernel shell_history enabled"

# load direnv
eval "$(direnv hook zsh)"

# 1pass op aws
export AWS_VAULT_FILE_PASSPHRASE="op://Private/aws-vault/password"
alias awsve='op run --no-masking -- aws-vault exec --backend=file'
