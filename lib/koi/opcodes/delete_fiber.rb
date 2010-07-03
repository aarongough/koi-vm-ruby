module Koi
  class VM
    
    # DELETE_FIBER
    def opcode24
      if(@state[:fibers].compact.size == 1)
        this_fiber[:instruction_pointer] += 1
      else
        @state[:fibers][@state[:fiber_id]] = nil
        while(@state[:fibers][@state[:fiber_id]].nil?)
          @state[:fiber_id] += 1
          @state[:fiber_id] = 0 if(@state[:fiber_id] > @state[:fibers].size)
        end
      end
    end
    
  end
end