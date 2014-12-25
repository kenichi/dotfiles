PS1='\[\033[00;33m\]\h\[\033[00m\]:\[\033[00;36m\]\W \[\033[00m\]\$ '
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
#PS1="\[\033[G\]$PS1" # reset bash prompt to first column
#JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
#MAGICK_HOME=/usr/local/imagemagick
ANDROID_HOME=/Users/ken/src/android/sdk
GOROOT=/Users/ken/src/lang/go
GOPATH=/Users/ken/src/go
LLVM=/opt/llvm/current
PATH=/opt/ruby/current/bin:/opt/node/current/bin:${LLVM}/bin:/usr/local/bin:$PATH:/Users/ken/bin:/usr/local/mysql/bin:/usr/local/pgsql/bin:$MAGICK_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$GOROOT/bin:$GOPATH/bin
#DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$MAGICK_HOME/lib/
SSL_CERT_FILE=/usr/local/ssl/certs/cert.pem
PAGER="`which less` -R"
DOCKER_HOST=tcp://
JRUBY_OPTS=--2.0
export PS1 PATH SSL_CERT_FILE PAGER ANDROID_HOME GOROOT GOPATH DOCKER_HOST JRUBY_OPTS #MAGICK_HOME DYLD_LIBRARY_PATH JAVA_HOME 

alias ls='ls -G'
#alias tunnel="sudo networksetup -setsocksfirewallproxystate 'Display Ethernet'"
alias be='bundle exec'
alias bi='bundle install'
alias gi='gem install --no-rdoc --no-ri'
alias bu='bundle update'
alias ansi='ansible --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i ops/ansible/development/inventory'

alias gfa='git fetch --all'
alias gpum='git pull up master'
alias gprum='git pull --rebase up master'

# rvm stuff
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# actually, fuck rvm...
OPT_RUBY_CURRENT=/opt/ruby/current
export RUBY_BIN=ruby
function opt_ruby_clear_current {
    rm ${OPT_RUBY_CURRENT}
}
function opt_ruby_restore_path {
    if [ -n "${OLD_PATH}" ]; then
        export PATH="${OLD_PATH}"
        unset OLD_PATH
    fi
}
function opt_ruby_187 {
    opt_ruby_clear_current
    opt_ruby_restore_path
    ln -s /opt/ruby/1.8.7-p358 ${OPT_RUBY_CURRENT}
    hash -r
    export RUBY_BIN=ruby
}
function opt_ruby_192 {
    opt_ruby_clear_current
    opt_ruby_restore_path
    ln -s /opt/ruby/1.9.2-p320 ${OPT_RUBY_CURRENT}
    hash -r
    export RUBY_BIN=ruby
}
function opt_ruby_193 {
    opt_ruby_clear_current
    opt_ruby_restore_path
    ln -s /opt/ruby/1.9.3-p448 ${OPT_RUBY_CURRENT}
    hash -r
    export RUBY_BIN=ruby
}
function opt_ruby_200 {
    opt_ruby_clear_current
    opt_ruby_restore_path
    ln -s /opt/ruby/2.0.0-p353 ${OPT_RUBY_CURRENT}
    hash -r
    export RUBY_BIN=ruby
}
function opt_ruby_210 {
    opt_ruby_clear_current
    opt_ruby_restore_path
    ln -s /opt/ruby/2.1.0 ${OPT_RUBY_CURRENT}
    hash -r
    export RUBY_BIN=ruby
}
function opt_ruby_211 {
    opt_ruby_clear_current
    opt_ruby_restore_path
    ln -s /opt/ruby/2.1.1 ${OPT_RUBY_CURRENT}
    hash -r
    export RUBY_BIN=ruby
}
function opt_ruby_212 {
    opt_ruby_clear_current
    opt_ruby_restore_path
    ln -s /opt/ruby/2.1.2 ${OPT_RUBY_CURRENT}
    hash -r
    export RUBY_BIN=ruby
}
function opt_ruby_213 {
    opt_ruby_clear_current
    opt_ruby_restore_path
    ln -s /opt/ruby/2.1.3 ${OPT_RUBY_CURRENT}
    hash -r
    export RUBY_BIN=ruby
}
function opt_ruby_215 {
    opt_ruby_clear_current
    opt_ruby_restore_path
    ln -s /opt/ruby/2.1.5 ${OPT_RUBY_CURRENT}
    hash -r
    export RUBY_BIN=ruby
}
function opt_rubinius {
    export OLD_PATH=$PATH
    opt_ruby_clear_current
    ln -s /opt/ruby/rbx ${OPT_RUBY_CURRENT}
    hash -r
    export PATH=/opt/ruby/rbx/gems/bin:$PATH
    export RUBY_BIN=ruby
}
function opt_jruby {
    opt_ruby_clear_current
    opt_ruby_restore_path
    ln -s /opt/ruby/jruby-1.7.15 ${OPT_RUBY_CURRENT}
    hash -r
    export RUBY_BIN=jruby
}
function opt_ruby_which {
    ls -l /opt/ruby/current | cut -c 43-
    ${RUBY_BIN} --version
}
alias wr=opt_ruby_which
alias 187=opt_ruby_187
alias 192=opt_ruby_192
alias 193=opt_ruby_193
alias 200=opt_ruby_200
alias 210=opt_ruby_210
alias 211=opt_ruby_211
alias 212=opt_ruby_212
alias 213=opt_ruby_213
alias 215=opt_ruby_215
alias rbx=opt_rubinius
alias jr=opt_jruby

# ansible stuff
# export ANSIBLE_ENV=/Users/ken/src/tools/ansible/hacking/env-setup
# [ -r ${ANSIBLE_ENV} -a -x ${ANSIBLE_ENV} ] && source ${ANSIBLE_ENV}
