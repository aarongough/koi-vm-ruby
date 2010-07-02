module Koi
  class VM
    
    # SET_LOCAL
    def opcode16
      raise StackError, "SET_LOCAL: Nothing on stack at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}" if(@state[:fibers][@state[:fiber_id]][:stack].size == 0)
      raise OperandError, "Operand not supplied to SET_LOCAL at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}" if(@state[:opcodes][@state[:fibers][@state[:fiber_id]][:instruction_pointer] + 1].nil?)
      raise OperandError, "Operand supplied to SET_LOCAL is not an integer at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}" unless(@state[:opcodes][@state[:fibers][@state[:fiber_id]][:instruction_pointer] + 1].is_a?(Integer))
      
      @state[:fibers][@state[:fiber_id]][:locals][@state[:opcodes][@state[:fibers][@state[:fiber_id]][:instruction_pointer] + 1]] = @state[:fibers][@state[:fiber_id]][:stack].pop
      @state[:fibers][@state[:fiber_id]][:instruction_pointer] += 2
    end
    
  end
end