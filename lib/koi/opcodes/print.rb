module Koi
  class VM
    
    # PRINT
    def opcode4
      expect_stack_size(1)
      fiber = this_fiber
      print fiber[:stack].pop
      fiber[:instruction_pointer] += 1
    end
    
  end
end