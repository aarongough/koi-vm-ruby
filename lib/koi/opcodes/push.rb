module Koi
  class VM
    
    # PUSH
    def opcode1
      raise RuntimeError, "Operand not supplied to PUSH at offset: #{@state[@state_identifier][:instruction_pointer]}" if(@opcodes[@state[@state_identifier][:instruction_pointer] + 1].nil?)
      @state[@state_identifier][:stack].push @opcodes[@state[@state_identifier][:instruction_pointer] + 1]
      @state[@state_identifier][:instruction_pointer] += 2
    end
    
  end
end