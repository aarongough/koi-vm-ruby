module Koi
  class VM
    
    # NO_OP
    def opcode0
      @state[@state_identifier][:instruction_pointer] += 1
    end
    
  end
end