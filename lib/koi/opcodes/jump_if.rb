module Koi
  class VM
    
    # JUMP_IF
    def opcode6
      raise StackError, "JUMP_IF: Nothing on stack at offset: #{@state[@state_identifier][:instruction_pointer]}" if(@state[@state_identifier][:stack].size == 0)
      raise OperandError, "Operand not supplied to JUMP_IF at offset: #{@state[@state_identifier][:instruction_pointer]}" if(@opcodes[@state[@state_identifier][:instruction_pointer] + 1].nil?)
      raise OperandError, "Operand supplied to JUMP_IF is not an integer at offset: #{@state[@state_identifier][:instruction_pointer]}" unless(@opcodes[@state[@state_identifier][:instruction_pointer] + 1].is_a?(Integer))
      if(@state[@state_identifier][:stack].pop > 0)
        @state[@state_identifier][:instruction_pointer] += @opcodes[@state[@state_identifier][:instruction_pointer] + 1]
      else
        @state[@state_identifier][:instruction_pointer] += 2
      end
    end
    
  end
end