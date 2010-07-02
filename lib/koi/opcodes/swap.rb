module Koi
  class VM
    
    # SWAP
    def opcode14
      raise StackError, "SWAP: Nothing on stack at offset: #{@state[@state_identifier][:instruction_pointer]}" if(@state[@state_identifier][:stack].size == 0)
      raise StackError, "SWAP: Not enough items on stack at offset: #{@state[@state_identifier][:instruction_pointer]}. Stack size: #{@state[@state_identifier][:stack].size}" if(@state[@state_identifier][:stack].size < 2)
      one = @state[@state_identifier][:stack].pop
      two = @state[@state_identifier][:stack].pop
      @state[@state_identifier][:stack].push one
      @state[@state_identifier][:stack].push two
      @state[@state_identifier][:instruction_pointer] += 1
    end
    
  end
end