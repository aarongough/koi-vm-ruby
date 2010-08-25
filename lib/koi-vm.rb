require_files = []

require_files << File.join(File.dirname(__FILE__), "koi-vm", "core.rb")
require_files << File.join(File.dirname(__FILE__), "koi-vm", "helpers.rb")
require_files << File.join(File.dirname(__FILE__), "koi-vm", "exceptions.rb")
require_files.concat Dir[File.join(File.dirname(__FILE__), 'koi-vm', '**', '*.rb')]

require_files.each do |file|
  require File.expand_path(file)
end