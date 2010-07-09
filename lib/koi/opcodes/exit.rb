module Koi
  class VM
    
    # EXIT
    def opcode64
      this_fiber[:instruction_pointer] += 1
      return true
    end    
    
  end
end