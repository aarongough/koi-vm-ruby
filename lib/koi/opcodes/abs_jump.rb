module Koi
  class VM
    
    # ABS_JUMP
    def opcode28
      expect_stack_size(1)
      fiber = this_fiber
      raise StackError, "Stack[-1] should be an integer" unless(fiber[:stack][-1].is_a?(Integer))
      this_fiber[:instruction_pointer] = fiber[:stack].pop
    end
    
  end
end