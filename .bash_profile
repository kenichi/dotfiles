JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home

EC2=/Users/ken/.ec2
EC2_HOME=$EC2/home
EC2_PRIVATE_KEY=$EC2/pk-BSEI32RQHLVFY4NZMFCT2UPAHPRLXMOH.pem
EC2_CERT=$EC2/cert-BSEI32RQHLVFY4NZMFCT2UPAHPRLXMOH.pem

#PATH=$PATH:/opt/local/bin:/opt/local/sbin:/Users/ken/bin:/opt/local/lib/postgresql83/bin
PATH=/usr/local/bin:$PATH:/usr/local/node/bin:/Users/ken/bin:$EC2_HOME/bin

PS1='\[\033[00;33m\]\h\[\033[00m\]:\[\033[00;36m\]\W \[\033[00m\]\$ '
#PS1="\[\033[38m\]\u@\h\[\033[01;32m\] \w \[\033[31m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[37m\]$\[\033[00m\] "

RACK_ENV=kn_dev

export PS1 PATH RACK_ENV EC2 EC2_HOME EC2_PRIVATE_KEY EC2_CERT JAVA_HOME

alias thin_start='bundle exec thin -e kn_dev -R config.ru -p 4567 start'
#alias thin_stop='thin -e kn_dev -R config.ru -p 4452 -a 10.1.10.208 stop'
alias ls='ls -G'
alias re='touch tmp/restart.txt'
alias nginx_start='sudo launchctl load -w /opt/local/etc/LaunchDaemons/org.macports.nginx'
alias nginx_stop='sudo launchctl unload -w /opt/local/etc/LaunchDaemons/org.macports.nginx'
#alias nginx_stop='sudo launchctl stop nginx'
alias trace='echo '\''Logging...'\'' > /Users/ken/Library/Preferences/Macromedia/Flash\ Player/Logs/flashlog.txt && tail -f /Users/ken/Library/Preferences/Macromedia/Flash\ Player/Logs/flashlog.txt'
alias be='bundle exec'
alias dbbs='be rake db:bootstrap'
alias dblf='be rake db:load_fixtures'

function setca() {
    rm -f /Users/ken/src/current_app
    cd /Users/ken/src && ln -s $1 current_app && cd $OLDPWD
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
