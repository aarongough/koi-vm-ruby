require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'koi-vm-ruby.rb'))

include KoiVMRuby

VM.new.run [
  PUSH_STRING, "Hello World!\n",
  PRINT
]
