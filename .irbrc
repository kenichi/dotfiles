
# IRB history patch <http://redmine.ruby-lang.org/issues/show/1556>

require 'irb/completion'
require 'irb/ext/save-history'

#require 'rubygems'
#require 'wirble'
#Wirble.init
#Wirble.colorize
#require 'irbtools'

IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
