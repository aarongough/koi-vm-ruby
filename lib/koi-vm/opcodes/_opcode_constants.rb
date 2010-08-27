module KoiVM
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
  TYPEOF        = 44
  TOP           = 45
  
  # 60
  ADD           = 60
  SUBTRACT      = 61
  MULTIPLY      = 62
  DIVIDE        = 63
  
  # 80
  CONCAT        = 80
  STRLEN        = 81
  TO_STRING     = 82
  
  # 100
  EQUAL         = 100
  LESS_THAN     = 101
  GREATER_THAN  = 102
  INVERT        = 103
  
  # 120
  PRINT         = 120
  GETS          = 121
  
  # 140
  SET_LOCAL     = 140
  GET_LOCAL     = 141
  SET_GLOBAL    = 142
  GET_GLOBAL    = 143
  
  # 160
  PUSH_FUNCTION = 160
  END_FUNCTION  = 161
  CALL          = 162
  RETURN        = 163
  TAILCALL      = 164
  
  # 180
  PUSH_HASH     = 180
  SET_KEY       = 181
  GET_KEY       = 182
  HAS_KEY       = 183
  LENGTH        = 184
  NUM_PAIRS     = 185
  
  # 240
  NO_OP         = 240
  EXIT          = 255
end             