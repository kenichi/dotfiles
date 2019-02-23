require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE

def clear; system 'clear'.freeze; end
def pbc s = nil
  s ||= yield if block_given?
  system "/bin/echo -n '#{s}' | pbcopy"
end
