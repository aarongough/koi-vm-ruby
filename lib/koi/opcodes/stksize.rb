module Koi
  class VM
    
    # STKSIZE
    def opcode3
      @state[@state_identifier][:stack].push(@state[@state_identifier][:stack].size)
      @state[@state_identifier][:instruction_pointer] += 1
    end
    
  end
end