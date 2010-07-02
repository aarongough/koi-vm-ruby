module Koi
  class VM
    
    # STKSIZE
    def opcode3
      @state[:fibers][@state[:fiber_id]][:stack].push(@state[:fibers][@state[:fiber_id]][:stack].size)
      @state[:fibers][@state[:fiber_id]][:instruction_pointer] += 1
    end
    
  end
end