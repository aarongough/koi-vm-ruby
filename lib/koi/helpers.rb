module Koi
  class VM
  
    def this_fiber
      @state[:fibers][@state[:fiber_id]]
    end
  
  end
end