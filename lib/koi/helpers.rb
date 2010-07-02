module Koi
  class VM
  
    def this_fiber
      @state[:fibers][@state[:fiber_id]]
    end
    
    def operand(klass = nil)
      next_opcode = @state[:opcodes][@state[:fibers][@state[:fiber_id]][:instruction_pointer] + 1]
      raise OperandError, "Operand not supplied at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}. Expected an operand of type: #{klass.name}" if(next_opcode.nil?)
      unless(klass.nil?)
        raise OperandError, "Incorrect operand type at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}. Expected '#{klass.name}' but got '#{next_opcode.class.name}'" unless(next_opcode.is_a?(klass))
      end
      return next_opcode
    end
  
  end
end