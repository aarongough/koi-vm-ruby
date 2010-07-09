module Koi
  NO_OP         = 0
  PUSH          = 1
  POP           = 2
  STKSIZE       = 3
  REL_JUMP      = 5
  JUMP_IF       = 6
  JUMP_UNLESS   = 7
  ADD           = 8
  SUBTRACT      = 9
  MULTIPLY      = 10
  DIVIDE        = 11
  DUP           = 12
  SWAP          = 14
  TOP           = 15
  SET_LOCAL     = 16
  GET_LOCAL     = 17
  SET_GLOBAL    = 18
  GET_GLOBAL    = 19
  INCREMENT     = 20
  DECREMENT     = 21
  FIBER_ID      = 22
  NEW_FIBER     = 23
  DELETE_FIBER  = 24
  OPEN_FILE     = 25
  FILE_PUT      = 26
  TO_STRING     = 27
  EXIT          = 64
end             