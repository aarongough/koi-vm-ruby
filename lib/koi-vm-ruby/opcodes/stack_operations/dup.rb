module KoiVMRuby
  class VM
    
    @@instruction[DUP] = Proc.new() do |vm|
      raise StackError, "Expecting at least two items on the data stack" unless(vm.data_stack.length > 0)
      vm.data_stack.push(vm.data_stack[-1])
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end