require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'koi.rb'))

include Koi

VM.new.run [
  PUSH, 1,
  PUSH, "w",
  OPEN_FILE,
  PUSH, "Hello World!\n",
  FILE_PUT
]