module Koi
  class VM
    
    # INCREMENT
    def opcode20
      expect_stack_size(1)
      fiber = this_fiber
      fiber[:stack].push fiber[:stack].pop.next
      fiber[:instruction_pointer] += 1
    end
    
  end
end