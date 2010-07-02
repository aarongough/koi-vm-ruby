module Koi
  class VM
    
    # PRINT
    def opcode4
      raise StackError, "PRINT: Nothing on stack at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}" if(@state[:fibers][@state[:fiber_id]][:stack].size == 0)
      print @state[:fibers][@state[:fiber_id]][:stack].pop
      @state[:fibers][@state[:fiber_id]][:instruction_pointer] += 1
    end
    
  end
end