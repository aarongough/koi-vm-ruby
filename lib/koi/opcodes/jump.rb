module Koi
  class VM
    
    # JUMP
    def opcode5
      raise RuntimeError, "Operand not supplied to JUMP at offset: #{@state[@state_identifier][:instruction_pointer]}" if(@opcodes[@state[@state_identifier][:instruction_pointer] + 1].nil?)
      raise OperandError, "Operand supplied to JUMP is not an integer at offset: #{@state[@state_identifier][:instruction_pointer]}" unless(@opcodes[@state[@state_identifier][:instruction_pointer] + 1].is_a?(Integer))
      @state[@state_identifier][:instruction_pointer] += @opcodes[@state[@state_identifier][:instruction_pointer] + 1]
    end
    
  end
end