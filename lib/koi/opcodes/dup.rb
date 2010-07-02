module Koi
  class VM
    
    # DUP
    def opcode12
      raise StackError, "DUP: Nothing on stack at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}" if(@state[:fibers][@state[:fiber_id]][:stack].size == 0)
      @state[:fibers][@state[:fiber_id]][:stack].push(@state[:fibers][@state[:fiber_id]][:stack][-1])
      @state[:fibers][@state[:fiber_id]][:instruction_pointer] += 1
    end
    
  end
end