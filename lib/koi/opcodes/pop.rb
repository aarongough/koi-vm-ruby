module Koi
  class VM
    
    # POP
    def opcode2
      raise StackError, "POP: Nothing on stack at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}" if(@state[:fibers][@state[:fiber_id]][:stack].pop.nil?)
      @state[:fibers][@state[:fiber_id]][:instruction_pointer] += 1
    end
    
  end
end