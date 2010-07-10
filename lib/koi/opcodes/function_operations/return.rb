module Koi
  class VM
    
    # RETURN
    def opcode32
      expect_stack_size(2)
      fiber = this_fiber
      fiber[:instruction_pointer] = fiber[:stack].delete_at(-2)
    end
    
  end
end