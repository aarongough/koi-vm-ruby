module Koi
  class VM
    
    # REL_JUMP
    def opcode5
      offset = operand(Integer)
      this_fiber[:instruction_pointer] += offset
    end
    
  end
end