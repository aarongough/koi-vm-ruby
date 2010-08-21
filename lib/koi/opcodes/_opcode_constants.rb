module Koi
  # 0
  PUSH_NIL      = 0
  PUSH_BOOL     = 1
  PUSH_INT      = 2
  PUSH_FLOAT    = 3
  PUSH_STRING   = 4
  
  # 20
  JUMP          = 20
  JUMP_IF       = 21
  JUMP_UNLESS   = 22
  
  # 40
  POP           = 40
  SWAP          = 41
  DUP           = 42
  STKSIZE       = 43
  
  # 60
  ADD           = 60
  SUBTRACT      = 61
  MULTIPLY      = 62
  DIVIDE        = 63
  
  # 80
  CONCAT        = 80
  STRLEN        = 81
  
  # 100
  TO_STRING     = 100
  
  # 120
  TYPEOF        = 120
  
  # 140
  EQUAL         = 140
  LESS_THAN     = 141
  MORE_THAN     = 142
  
  # 160
  PRINT         = 160
  GETS          = 161
  
  # 180
  SET_LOCAL     = 180
  GET_LOCAL     = 181
  SET_GLOBAL    = 182
  GET_GLOBAL    = 183
  
  # 200
  PUSH_FUNCTION = 200
  END_FUNCTION  = 201
  CALL          = 202
  RETURN        = 203
  TAILCALL      = 204
  
  # 220
  NO_OP         = 220
  
  # 240
  EXIT          = 255
end             