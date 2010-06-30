module Koi
  class VM
    
    # MULTIPLY
    def opcode10
      raise StackError, "MULTIPLY: Not enough items on stack at offset: #{@state[@state_identifier][:instruction_pointer]}. Stack size: #{@state[@state_identifier][:stack].size}" if(@state[@state_identifier][:stack].size < 2)
      @state[@state_identifier][:stack].push(@state[@state_identifier][:stack].pop * @state[@state_identifier][:stack].pop)
      @state[@state_identifier][:instruction_pointer] += 1
    end
    
  end
end