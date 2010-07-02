module Koi
  class VM
    
    # SUBTRACT
    def opcode9
      raise StackError, "SUBTRACT: Not enough items on stack at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}. Stack size: #{@state[:fibers][@state[:fiber_id]][:stack].size}" if(@state[:fibers][@state[:fiber_id]][:stack].size < 2)
      right_operand = @state[:fibers][@state[:fiber_id]][:stack].pop
      left_operand = @state[:fibers][@state[:fiber_id]][:stack].pop
      @state[:fibers][@state[:fiber_id]][:stack].push(left_operand - right_operand)
      @state[:fibers][@state[:fiber_id]][:instruction_pointer] += 1
    end
    
  end
end