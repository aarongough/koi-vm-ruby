module Koi
  class VM
    
    # JUMP_UNLESS
    def opcode7
      raise StackError, "JUMP_UNLESS: Nothing on stack at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}" if(@state[:fibers][@state[:fiber_id]][:stack].size == 0)
      raise OperandError, "Operand not supplied to JUMP_UNLESS at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}" if(@state[:opcodes][@state[:fibers][@state[:fiber_id]][:instruction_pointer] + 1].nil?)
      raise OperandError, "Operand supplied to JUMP_UNLESS is not an integer at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}" unless(@state[:opcodes][@state[:fibers][@state[:fiber_id]][:instruction_pointer] + 1].is_a?(Integer))
      if(@state[:fibers][@state[:fiber_id]][:stack].pop < 0)
        @state[:fibers][@state[:fiber_id]][:instruction_pointer] += @state[:opcodes][@state[:fibers][@state[:fiber_id]][:instruction_pointer] + 1]
      else
        @state[:fibers][@state[:fiber_id]][:instruction_pointer] += 2
      end
    end
    
  end
end