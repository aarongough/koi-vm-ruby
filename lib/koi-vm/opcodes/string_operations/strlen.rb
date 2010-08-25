module KoiVM
  class VM
    
    @@instruction[STRLEN] = Proc.new() do |vm|
      raise StackError, "Expecting at least one items on the data stack" unless(vm.data_stack.length > 0)
      raise StackError, "Expecting topmost item on stack to be a string" unless((vm.data_stack[-1][0] == STRING_))
      vm.data_stack.push([INTEGER_, vm.data_stack.pop[1].length])
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end