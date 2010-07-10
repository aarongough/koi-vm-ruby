module Koi
  class VM
    
    # ARRAY_GET_INDEX
    def opcode161
      expect_stack_size(2)
      fiber = this_fiber
      raise StackError, "Expected array at stack[-2]" unless(fiber[:stack][-2].is_a?(Array))
      raise StackError, "Expected integer at stack[-1]" unless(fiber[:stack][-1].is_a?(Integer))
      fiber[:stack].push fiber[:stack][-2][fiber[:stack].pop]
      fiber[:instruction_pointer] += 1
    end
    
  end
end