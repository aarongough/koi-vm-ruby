module Koi
  class VM
    
    # DUP
    def opcode12
      expect_stack_size(1)
      fiber = this_fiber
      fiber[:stack].push(fiber[:stack][-1])
      fiber[:instruction_pointer] += 1
    end
    
  end
end