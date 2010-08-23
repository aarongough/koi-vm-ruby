require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'koi.rb'))

include Koi

VM.new.run [
  PUSH_INT, 11,
  PUSH_INT, 1,
  SUBTRACT,
  DUP,
  TO_STRING,
  PRINT,
  PUSH_STRING, ", ",
  PRINT,
  DUP,
  PUSH_INT, 0,
  EQUAL,
  JUMP_UNLESS, -13,
  PUSH_STRING, "Blast Off!\n",
  PRINT
]