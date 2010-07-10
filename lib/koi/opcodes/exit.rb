module Koi
  class VM
    
    # EXIT
    def opcode255
      this_fiber[:instruction_pointer] += 1
      return true
    end    
    
  end
end