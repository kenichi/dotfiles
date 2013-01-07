PS1='\[\033[00;33m\]\h\[\033[00m\]:\[\033[00;36m\]\W \[\033[00m\]\$ '
# PS1="\[\033[G\]$PS1" # reset bash prompt to first column
JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
#MAGICK_HOME=/usr/local/imagemagick
PATH=/opt/ruby/current/bin:/opt/node/current/bin:/usr/local/bin:$PATH:/Users/ken/bin:/usr/local/mysql/bin:/usr/local/pgsql/bin:$MAGICK_HOME/bin
#DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$MAGICK_HOME/lib/
SSL_CERT_FILE=/usr/local/ssl/certs/cert.pem
export PS1 PATH JAVA_HOME SSL_CERT_FILE #MAGICK_HOME DYLD_LIBRARY_PATH

alias ls='ls -G'
alias tunnel="sudo networksetup -setsocksfirewallproxystate 'Display Ethernet'"
alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'

alias gfa='git fetch --all'
alias gpum='git pull up master'
alias gprum='git pull --rebase up master'

alias pp="SCREEN_SESSION_NAME='pedal power' screen -c ~/.screen/rc/pp"
alias gds="SCREEN_SESSION_NAME='geoloqi-developer-site' screen -c ~/.screen/rc/gds"
alias gapi="SCREEN_SESSION_NAME='geoloqi-api-v2' screen -c ~/.screen/rc/gapi"
alias gt="SCREEN_SESSION_NAME='geoloqi-triggers' screen -c ~/.screen/rc/gt"

# rvm stuff
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# actually, fuck rvm...
OPT_RUBY_CURRENT=/opt/ruby/current
function opt_ruby_clear_current {
    rm ${OPT_RUBY_CURRENT}
}
function opt_ruby_187 {
    opt_ruby_clear_current
    ln -s /opt/ruby/1.8.7-p358 ${OPT_RUBY_CURRENT}
    hash -r
}
function opt_ruby_192 {
    opt_ruby_clear_current
    ln -s /opt/ruby/1.9.2-p320 ${OPT_RUBY_CURRENT}
    hash -r
}
function opt_ruby_193 {
    opt_ruby_clear_current
    ln -s /opt/ruby/1.9.3-p362 ${OPT_RUBY_CURRENT}
    hash -r
}
function opt_rubinius {
    opt_ruby_clear_current
    ln -s /opt/ruby/rbx-head ${OPT_RUBY_CURRENT}
    hash -r
}
function opt_jruby {
    opt_ruby_clear_current
    ln -s /opt/ruby/jruby-1.7.0 ${OPT_RUBY_CURRENT}
    hash -r
}
function opt_ruby_which {
    ls -l /opt/ruby/current | cut -c 43-
    ruby --version
}
alias wr=opt_ruby_which
alias 187=opt_ruby_187
alias 192=opt_ruby_192
alias 193=opt_ruby_193
alias rbx=opt_rubinius
alias jr=opt_jruby
