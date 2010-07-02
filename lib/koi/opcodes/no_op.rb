module Koi
  class VM
    
    # NO_OP
    def opcode0
      @state[:fibers][@state[:fiber_id]][:instruction_pointer] += 1
    end
    
  end
end