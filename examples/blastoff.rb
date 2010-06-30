require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'koi.rb'))

include Koi

VM.new.run [
  PUSH, 11,
  PUSH, 1,
  SUBTRACT,
  DUP,
  PRINT,
  PUSH, ", ",
  PRINT,
  DUP, 
  JUMP_IF, -9,
  PUSH, "Blast off!\n",
  PRINT
]