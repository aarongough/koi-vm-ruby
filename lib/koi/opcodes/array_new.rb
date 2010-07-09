module Koi
  class VM
    
    # ARRAY_NEW
    def opcode33
      fiber = this_fiber
      fiber[:stack].push []
      fiber[:instruction_pointer] += 1
    end
    
  end
end