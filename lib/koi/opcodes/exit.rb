module Koi
  class VM
    
    # EXIT
    def opcode12
      @state[@state_identifier][:instruction_pointer] += 1
      return true
    end    
    
  end
end