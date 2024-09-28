# frozen_string_literal: true

begin
  require "irb/ext/save-history"
rescue LoadError
end
IRB.conf[:SAVE_HISTORY] = 2000
IRB.conf[:HISTORY_FILE] = "#{ENV["HOME"]}/.irb-history"
