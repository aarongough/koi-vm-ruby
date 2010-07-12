module Koi
  class VM
    
    # HASH_GET_KEY
    def opcode181
      expect_stack_size(3)
      fiber = this_fiber
      raise StackError, "Expected array at stack[-2]" unless(fiber[:stack][-2].is_a?(Hash))
      fiber[:stack].push fiber[:stack][-2][fiber[:stack].pop]
      fiber[:instruction_pointer] += 1
    end
    
  end
end