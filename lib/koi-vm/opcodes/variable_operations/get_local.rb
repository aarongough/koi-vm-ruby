module KoiVM
  class VM
    
    @@instruction[GET_LOCAL] = Proc.new() do |vm|
      vm.data_stack.push( vm.locals[vm.opcodes[vm.instruction_pointer + 1]] )
      vm.instruction_pointer = vm.instruction_pointer + 2
    end
    
  end
end