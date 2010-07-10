module Koi
  class VM
    
    # ARRAY_NEW
    def opcode160
      fiber = this_fiber
      fiber[:stack].push []
      fiber[:instruction_pointer] += 1
    end
    
  end
end