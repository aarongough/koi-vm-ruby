module Koi
  class VM
    
    # NO_OP
    def opcode0
      this_fiber[:instruction_pointer] += 1
    end
    
  end
end