module Koi
  class VM
    
    def operand(klass = nil)
      next_opcode = @state[:opcodes][@state[:fiber][:instruction_pointer] + 1]
      message = "Operand not supplied at offset: #{@state[:fibers][@state[:fiber_id]][:instruction_pointer]}."
      message += " Expected an operand of type: #{klass.name}" unless(klass.nil?)
      raise OperandError, message if(next_opcode.nil?)
      unless(klass.nil?)
        raise OperandError, "Incorrect operand type at offset: #{@state[:fiber][:instruction_pointer]}. Expected '#{klass.name}' but got '#{next_opcode.class.name}'" unless(next_opcode.is_a?(klass))
      end
      return next_opcode
    end
    
    def expect_stack_size(size)
      raise StackError, "Expecting at lease #{size} items on the stack at offset: #{@state[:fiber][:instruction_pointer]}" if(@state[:fiber][:stack].size < size)
    end
  
  end
end