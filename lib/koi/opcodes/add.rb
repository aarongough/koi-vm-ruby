module Koi
  class VM
    
    # ADD
    def opcode8
      expect_stack_size(2)
      fiber = this_fiber
      fiber[:stack].push(fiber[:stack].pop + fiber[:stack].pop)
      fiber[:instruction_pointer] += 1
    end
    
  end
end