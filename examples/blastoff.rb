require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'koi.rb'))

include Koi

VM.new.run [
  PUSH, 11,
  DECREMENT,
  DUP,
  PRINT,
  PUSH, ", ",
  PRINT,
  DUP, 
  JUMP_IF, -7,
  PUSH, "Blast off!\n",
  PRINT
]