require_files = []

require_files << File.join(File.dirname(__FILE__), "koi-vm-ruby", "core.rb")
require_files << File.join(File.dirname(__FILE__), "koi-vm-ruby", "helpers.rb")
require_files << File.join(File.dirname(__FILE__), "koi-vm-ruby", "exceptions.rb")
require_files.concat Dir[File.join(File.dirname(__FILE__), 'koi-vm-ruby', '**', '*.rb')].sort

require_files.each do |file|
  require File.expand_path(file)
end
