module Koi
  class VM
    
    # POP
    def opcode2
      expect_stack_size(1)
      fiber = this_fiber
      fiber[:stack].pop
      fiber[:instruction_pointer] += 1
    end
    
  end
end