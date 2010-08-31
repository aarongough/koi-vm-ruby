module KoiVMRuby
  class VM
    
    @@instruction[PUSH_BOOL] = Proc.new() do |vm|
      operand = vm.opcodes[vm.instruction_pointer + 1]
      raise OperandError, "Expecting boolean value but got #{operand.inspect}" unless(operand.is_a?(TrueClass) or operand.is_a?(FalseClass))
      vm.data_stack.push([BOOL_, operand])
      vm.instruction_pointer = vm.instruction_pointer + 2
    end
    
  end
end