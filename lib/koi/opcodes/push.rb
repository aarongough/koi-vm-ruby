module Koi
  class VM
    
    # PUSH
    def opcode1
      fiber = this_fiber
      fiber[:stack].push operand
      fiber[:instruction_pointer] += 2
    end
    
  end
end