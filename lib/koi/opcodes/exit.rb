module Koi
  class VM
    
    # EXIT
    def opcode64
      @state[:fibers][@state[:fiber_id]][:instruction_pointer] += 1
      return true
    end    
    
  end
end