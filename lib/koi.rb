require_files = []

require_files << File.join(File.dirname(__FILE__), "koi", "core.rb")
require_files << File.join(File.dirname(__FILE__), "koi", "helpers.rb")
require_files << File.join(File.dirname(__FILE__), "koi", "exceptions.rb")
require_files.concat Dir[File.join(File.dirname(__FILE__), 'koi', '**', '*.rb')]

require_files.each do |file|
  require File.expand_path(file)
end