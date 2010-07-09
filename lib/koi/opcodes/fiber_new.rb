module Koi
  class VM
    
    # FIBER_NEW
    def opcode23
      this_fiber[:instruction_pointer] += 1
      @state[:fibers].push Marshal.load(Marshal.dump(@state[:fibers][@state[:fiber_id]]))
      @state[:fiber_id] = @state[:fibers].size - 1
    end
    
  end
end