module Koi
  class VM
    
    # SET_GLOBAL
    def opcode18
      expect_stack_size(1)
      fiber = this_fiber      
      @state[:globals][operand(Integer)] = fiber[:stack].pop
      fiber[:instruction_pointer] += 2
    end
    
  end
end