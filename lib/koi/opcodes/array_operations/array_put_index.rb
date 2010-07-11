module Koi
  class VM
    
    # ARRAY_PUT_INDEX
    def opcode162
      expect_stack_size(3)
      fiber = this_fiber
      raise StackError, "Expected array at stack[-3]" unless(fiber[:stack][-3].is_a?(Array))
      raise StackError, "Expected integer at stack[-2]" unless(fiber[:stack][-2].is_a?(Integer))
      fiber[:stack][-3][fiber[:stack][-2]] = fiber[:stack].pop
      fiber[:stack].pop
      fiber[:instruction_pointer] += 1
    end
    
  end
end