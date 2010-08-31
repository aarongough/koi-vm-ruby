module KoiVMRuby
  class VM
    
    @@instruction[GET_GLOBAL] = Proc.new() do |vm|
      vm.data_stack.push( vm.globals[vm.opcodes[vm.instruction_pointer + 1]] )
      vm.instruction_pointer = vm.instruction_pointer + 2
    end
    
  end
end