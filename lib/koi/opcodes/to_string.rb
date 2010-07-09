module Koi
  class VM
    
    # TO_STRING
    def opcode27
      expect_stack_size(1)
      fiber = this_fiber
      fiber[:stack].push fiber[:stack].pop.to_s
      fiber[:instruction_pointer] += 1
    end
    
  end
end