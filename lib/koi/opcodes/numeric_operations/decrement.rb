module Koi
  class VM
    
    # DECREMENT
    def opcode21
      expect_stack_size(1)
      fiber = this_fiber
      fiber[:stack][-1] -= 1
      fiber[:instruction_pointer] += 1
    end
    
  end
end