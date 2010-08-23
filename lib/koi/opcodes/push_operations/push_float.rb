module Koi
  class VM
    
    @@instruction[PUSH_FLOAT] = Proc.new() do |vm|
      operand = vm.opcodes[vm.instruction_pointer + 1]
      raise OperandError, "Expecting float value but got #{operand.inspect}" unless(operand.is_a?(Float))
      vm.data_stack.push([FLOAT_, operand])
      vm.instruction_pointer = vm.instruction_pointer + 2
    end
    
  end
end