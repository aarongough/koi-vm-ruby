module Koi
  class VM
    
    # ADD
    def opcode8
      raise StackError, "ADD: Not enough items on stack at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}. Stack size: #{@state[:fibers][@state[:fiber_id]][:stack].size}" if(@state[:fibers][@state[:fiber_id]][:stack].size < 2)
      @state[:fibers][@state[:fiber_id]][:stack].push(@state[:fibers][@state[:fiber_id]][:stack].pop + @state[:fibers][@state[:fiber_id]][:stack].pop)
      @state[:fibers][@state[:fiber_id]][:instruction_pointer] += 1
    end
    
  end
end