# set -o vi and mimic 'set backspace'
bindkey -v '^?' backward-delete-char

# lil more history
export HISTFILE=~/.zsh_history
export HISTSIZE=9999
export SAVEHIST=$HISTSIZE

export EDITOR=`which nvim`
export ERL_AFLAGS="-kernel shell_history enabled"

# aliases
alias ls='ls --color'
alias ssh-nohostkey='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias scp-nohostkey='scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias ts='tmux split-window -v -c `pwd`'
alias th='tmux split-window -h -c `pwd`'
alias tm='tmux rename-window $(basename `pwd`)'

# tell zsh path has unique values
typeset -U path PATH

# pnpm [command] -g
export PNPM_HOME=$HOME/.pnpm

case `uname -s` in
  Darwin)
    alias ls='ls -G'
    alias dkc='docker compose'

    export GOPATH=/Users/kenichi/src/go
    export PNPM_HOME="/Users/kenichi/Library/pnpm"

    path=(
      $PNPM_HOME
      /opt/homebrew/bin
      $GOPATH/bin
      $HOME/bin
      $path
    )

    export PS1='%F{240}%n%F{94}@%F{130}%m%f %F{166}%1~ %f%# '

    # appstore tailscale
    alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

    # 1pass op aws
    export AWS_VAULT_FILE_PASSPHRASE="op://Private/aws-vault/password"
    alias awsve='op run --no-masking -- aws-vault exec --backend=file'

    # mise
    eval "$(mise activate zsh)"
    ;;

  FreeBSD)
    export PS1='%F{240}%n%F{52}@%F{124}%m%f %F{88}%1~ %f%# '
    ;;


  Linux)
    alias dkc='docker compose'

    export PS1='%F{137}%n%F{138}@%F{139}%m%f %F{140}%1~ %f%# '

    if [ "`uname -v`" = "BrandZ virtual linux" ]; then
      alias ps='/native/usr/bin/ps'
      path=(
        $path
        $HOME/bin
      )
    fi

    # mise
    eval "$(/home/kenichi/.local/bin/mise activate zsh)"
    ;;


  SunOS)
    alias psql='psql -h/mnt/share/tmp -U postgres'

    export PS1='%F{240}%n%F{108}@%F{110}%m%f %F{69}%1~ %f%# '

    # pkgconfig
    typeset -T PKG_CONFIG_PATH pkg_config_path
    typeset -U path PKG_CONFIG_PATH 
    pkg_config_path=(
      /opt/ooce/lib/amd64/pkgconfig
      /opt/ooce/lib/pkgconfig
    )
    
    export GOPATH=/rpool/zones/share/src/go
    path=(
      /usr/gnu/bin
      $path
      $GOPATH/bin
      /opt/ooce/node-22/bin
      $PNPM_HOME
      $HOME/bin
    )

    # don't use swap /tmp
    export TMPDIR=/var/tmp
    export MISE_TMP_DIR=/var/tmp

    # rustup (needed to build mise, ooce rust OOMed)
    source ~/.cargo/env

    # mise
    eval "$(mise activate zsh)"
    ;;
esac
