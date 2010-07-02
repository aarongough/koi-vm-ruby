module Koi
  class VM
    
    # STKSIZE
    def opcode3
      fiber = this_fiber
      fiber[:stack].push(fiber[:stack].size)
      fiber[:instruction_pointer] += 1
    end
    
  end
end