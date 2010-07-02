module Koi
  class VM
    
    # SWAP
    def opcode14
      raise StackError, "SWAP: Nothing on stack at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}" if(@state[:fibers][@state[:fiber_id]][:stack].size == 0)
      raise StackError, "SWAP: Not enough items on stack at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}. Stack size: #{@state[:fibers][@state[:fiber_id]][:stack].size}" if(@state[:fibers][@state[:fiber_id]][:stack].size < 2)
      one = @state[:fibers][@state[:fiber_id]][:stack].pop
      two = @state[:fibers][@state[:fiber_id]][:stack].pop
      @state[:fibers][@state[:fiber_id]][:stack].push one
      @state[:fibers][@state[:fiber_id]][:stack].push two
      @state[:fibers][@state[:fiber_id]][:instruction_pointer] += 1
    end
    
  end
end