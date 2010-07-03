module Koi
  class VM
    
    # FIBER_ID
    def opcode22
      fiber = this_fiber
      fiber[:stack].push @state[:fiber_id]
      fiber[:instruction_pointer] += 1
    end
    
  end
end