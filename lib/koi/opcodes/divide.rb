module Koi
  class VM
    
    # DIVIDE
    def opcode11
      raise StackError, "DIVIDE: Not enough items on stack at offset: #{@state[@state_identifier][:instruction_pointer]}. Stack size: #{@state[@state_identifier][:stack].size}" if(@state[@state_identifier][:stack].size < 2)
      right_operand = @state[@state_identifier][:stack].pop
      left_operand = @state[@state_identifier][:stack].pop
      @state[@state_identifier][:stack].push(left_operand / right_operand)
      @state[@state_identifier][:instruction_pointer] += 1
    end
    
  end
end