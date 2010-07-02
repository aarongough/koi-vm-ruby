module Koi
  class VM
    
    # JUMP
    def opcode5
      offset = operand(Integer)
      this_fiber[:instruction_pointer] += offset
    end
    
  end
end