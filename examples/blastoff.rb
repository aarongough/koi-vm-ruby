require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'koi.rb'))

include Koi

VM.new.run [
  PUSH, 11,
  PUSH, 1,
  SUBTRACT,
  DUP,
  PRINT,
  DUP, 
  JUMP_IF, -6,
  PUSH, "Blast off!",
  PRINT
]