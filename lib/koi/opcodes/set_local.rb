module Koi
  class VM
    
    # SET_LOCAL
    def opcode16
      expect_stack_size(1)
      fiber = this_fiber      
      fiber[:locals][operand(Integer)] = fiber[:stack].pop
      fiber[:instruction_pointer] += 2
    end
    
  end
end