module Koi
  class VM
    
    # MULTIPLY
    def opcode10
      raise StackError, "MULTIPLY: Not enough items on stack at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}. Stack size: #{@state[:fibers][@state[:fiber_id]][:stack].size}" if(@state[:fibers][@state[:fiber_id]][:stack].size < 2)
      @state[:fibers][@state[:fiber_id]][:stack].push(@state[:fibers][@state[:fiber_id]][:stack].pop * @state[:fibers][@state[:fiber_id]][:stack].pop)
      @state[:fibers][@state[:fiber_id]][:instruction_pointer] += 1
    end
    
  end
end