module KoiVM
  class VM
    
    @@instruction[JUMP] = Proc.new() do |vm|
      operand = vm.opcodes[vm.instruction_pointer + 1]
      raise OperandError, "Expecting integer value but got #{operand.inspect}" unless(operand.is_a?(Integer))
      vm.instruction_pointer = vm.instruction_pointer + operand
    end
    
  end
end