module KoiVM
  class VM
    
    @@instruction[DIVIDE] = Proc.new() do |vm|
      raise StackError, "Expecting at least two items on the data stack" unless(vm.data_stack.length > 1)
      vm.data_stack[-2][1] = vm.data_stack[-2][1] / vm.data_stack[-1][1]
      vm.data_stack.pop
      vm.data_stack[-1][0] = INTEGER_ if(vm.data_stack[-1][1].is_a?(Integer))
      vm.data_stack[-1][0] = FLOAT_ if(vm.data_stack[-1][1].is_a?(Float))
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end