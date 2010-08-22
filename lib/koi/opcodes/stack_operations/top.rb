module Koi
  class VM
    
    @@instruction[TOP] = Proc.new() do |vm|
      operand = vm.opcodes[vm.instruction_pointer + 1]
      raise OperandError, "Expecting operand to be a integer but got #{operand.class}" unless(operand.is_a?(Integer))
      raise StackError, "Expecting at least #{operand} items on the data stack" unless(vm.data_stack.length > (operand - 1))
      vm.data_stack.concat(vm.data_stack.slice(-1 - (operand - 1), vm.data_stack.length))
      vm.instruction_pointer = vm.instruction_pointer + 2
    end
    
  end
end