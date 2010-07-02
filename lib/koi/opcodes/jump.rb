module Koi
  class VM
    
    # JUMP
    def opcode5
      raise OperandError, "Operand not supplied to JUMP at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}" if(@state[:opcodes][@state[:fibers][@state[:fiber_id]][:instruction_pointer] + 1].nil?)
      raise OperandError, "Operand supplied to JUMP is not an integer at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}" unless(@state[:opcodes][@state[:fibers][@state[:fiber_id]][:instruction_pointer] + 1].is_a?(Integer))
      @state[:fibers][@state[:fiber_id]][:instruction_pointer] += @state[:opcodes][@state[:fibers][@state[:fiber_id]][:instruction_pointer] + 1]
    end
    
  end
end