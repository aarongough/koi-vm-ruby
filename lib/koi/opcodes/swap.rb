module Koi
  class VM
    
    # SWAP
    def opcode14
      expect_stack_size(2)
      fiber = this_fiber
      one = fiber[:stack].pop
      two = fiber[:stack].pop
      fiber[:stack].push one
      fiber[:stack].push two
      fiber[:instruction_pointer] += 1
    end
    
  end
end