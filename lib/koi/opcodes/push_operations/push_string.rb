module Koi
  class VM
    
    @@instruction[PUSH_STRING] = Proc.new() do |vm|
      operand = vm.opcodes[vm.instruction_pointer + 1]
      raise OperandError, "Expecting string value but got #{operand.inspect}" unless(operand.is_a?(String))
      vm.data_stack.push([STRING_, operand])
      vm.instruction_pointer = vm.instruction_pointer + 2
    end
    
  end
end