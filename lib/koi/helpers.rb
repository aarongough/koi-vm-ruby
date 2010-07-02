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
    
    def expect_stack_size(size)
      raise StackError, "Expecting at lease #{size} items on the stack at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}" if(@state[:fibers][@state[:fiber_id]][:stack].size < size)
    end
  
  end
end