module KoiVM
  class VM
    
    @@instruction[PUSH_FUNCTION] = Proc.new() do |vm|
      vm.data_stack.push([FUNCTION_, vm.instruction_pointer + 2])
      function_id = vm.opcodes[vm.instruction_pointer + 1]
      while(true)
        vm.instruction_pointer = vm.opcodes.slice(vm.instruction_pointer, vm.opcodes.length).index(END_FUNCTION)
        break if(vm.opcodes.slice(vm.instruction_pointer, 4) == [END_FUNCTION, 0, END_FUNCTION, function_id])
      end
      vm.instruction_pointer = vm.instruction_pointer + 4
    end
    
  end
end