module Koi
  class VM
    
    # HASH_PUT_KEY
    def opcode182
      expect_stack_size(3)
      fiber = this_fiber
      raise StackError, "Expected hash at stack[-2]" unless(fiber[:stack][-3].is_a?(Hash))
      fiber[:stack][-3][fiber[:stack][-2]] = fiber[:stack].pop
      fiber[:stack].pop
      fiber[:instruction_pointer] += 1
    end
    
  end
end