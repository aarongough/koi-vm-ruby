module Koi
  class VM
    
    # NO_OP
    def opcode0
      @state[0][:instruction_pointer] += 1
    end
    
  end
end