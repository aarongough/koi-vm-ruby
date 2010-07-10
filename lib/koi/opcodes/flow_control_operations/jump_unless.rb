module Koi
  class VM
    
    # JUMP_UNLESS
    def opcode7
      expect_stack_size(1)
      offset = operand(Integer)
      fiber = this_fiber
      if(fiber[:stack].pop < 0)
        fiber[:instruction_pointer] += offset
      else
        fiber[:instruction_pointer] += 2
      end
    end
    
  end
end