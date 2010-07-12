module Koi
  NO_OP             = 0
                    
  # 20              
  PUSH              = 1
  POP               = 2
  STKSIZE           = 3
  DUP               = 12
  SWAP              = 14
  TOP               = 15
                    
  # 40              
  ABS_JUMP          = 28 #
  REL_JUMP          = 5  #
  JUMP_IF           = 6
  JUMP_UNLESS       = 7
                    
  # 60              
  ADD               = 8
  SUBTRACT          = 9
  MULTIPLY          = 10
  DIVIDE            = 11
  INCREMENT         = 20
  DECREMENT         = 21
                    
  # 80              
  SET_LOCAL         = 16 #
  GET_LOCAL         = 17 #
  SET_GLOBAL        = 18
  GET_GLOBAL        = 19
                    
  # 100             
  FIBER_ID          = 22
  FIBER_NEW         = 23
  FIBER_DELETE      = 24
                    
  # 120             
  FILE_OPEN         = 25
  FILE_PUT          = 26
                    
  # 140             
  PUSH_FUNCTION     = 29 #
  END_FUNCTION      = 30 #
  CALL              = 31 #
  RETURN            = 32 #
                    
  # 160             
  ARRAY_NEW         = 160
  ARRAY_GET_INDEX   = 161
  ARRAY_PUT_INDEX   = 162
  
  # 180
  HASH_NEW          = 180
  HASH_GET_KEY      = 181
  HASH_PUT_KEY      = 182
  
  # 200
  TO_STRING         = 27
  
  
  
  
  EXIT              = 255
end             