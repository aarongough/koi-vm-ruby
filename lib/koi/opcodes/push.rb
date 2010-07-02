module Koi
  class VM
    
    # PUSH
    def opcode1
      raise OperandError, "Operand not supplied to PUSH at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}" if(@state[:opcodes][@state[:fibers][@state[:fiber_id]][:instruction_pointer] + 1].nil?)
      @state[:fibers][@state[:fiber_id]][:stack].push @state[:opcodes][@state[:fibers][@state[:fiber_id]][:instruction_pointer] + 1]
      @state[:fibers][@state[:fiber_id]][:instruction_pointer] += 2
    end
    
  end
end