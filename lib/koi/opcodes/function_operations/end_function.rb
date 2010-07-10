module Koi
  class VM
    
    # END_FUNCTION
    def opcode30
      this_fiber[:instruction_pointer] += 1
    end
    
  end
end