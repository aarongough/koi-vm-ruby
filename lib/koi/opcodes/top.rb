module Koi
  class VM
    
    # TOP
    def opcode15
      raise OperandError, "Operand not supplied to TOP at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}" if(@state[:opcodes][@state[:fibers][@state[:fiber_id]][:instruction_pointer] + 1].nil?)
      raise OperandError, "Operand supplied to TOP is not an integer at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}" unless(@state[:opcodes][@state[:fibers][@state[:fiber_id]][:instruction_pointer] + 1].is_a?(Integer))
      raise StackError, "TOP: Not enough items on stack at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}. Stack size: #{@state[:fibers][@state[:fiber_id]][:stack].size}" if(@state[:fibers][@state[:fiber_id]][:stack].size < @state[:opcodes][@state[:fibers][@state[:fiber_id]][:instruction_pointer] + 1])
      
      slice_size = @state[:opcodes][@state[:fibers][@state[:fiber_id]][:instruction_pointer] + 1]
      
      @state[:fibers][@state[:fiber_id]][:stack].concat(@state[:fibers][@state[:fiber_id]][:stack][slice_size - slice_size - slice_size, @state[:fibers][@state[:fiber_id]][:stack].size])
      @state[:fibers][@state[:fiber_id]][:instruction_pointer] += 2
    end
    
  end
end