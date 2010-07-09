require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'koi.rb'))

include Koi

VM.new.run [
  PUSH, 1,    # Open STDOUT for writing
  PUSH, "w",
  FILE_OPEN,
  PUSH, 11,   
  DECREMENT,
  DUP,
  PUSH, 1,
  SWAP,
  TO_STRING,
  FILE_PUT,
  PUSH, 1,
  PUSH, ", ",
  FILE_PUT,
  DUP, 
  JUMP_IF, -13,
  PUSH, 1,
  PUSH, "Blast off!\n",
  FILE_PUT
]