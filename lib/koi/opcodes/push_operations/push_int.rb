module Koi
  class VM
    
    @@instruction[PUSH_INT] = Proc.new() do |vm|
      operand = vm.opcodes[vm.instruction_pointer + 1]
      raise OperandError, "Expecting integer value but got #{operand.inspect}" unless(operand.is_a?(Integer))
      vm.data_stack.push([INTEGER_, operand])
      vm.instruction_pointer = vm.instruction_pointer + 2
    end
    
  end
end