module KoiVM
  class VM
    
    @@instruction[INVERT] = Proc.new() do |vm|
      raise StackError, "Expecting at least one item on the data stack" unless(vm.data_stack.length > 0)
      raise StackError, "Expecting boolean value" unless(vm.data_stack[-1][0] == BOOL_)
      vm.data_stack[-1][1] = !vm.data_stack[-1][1]
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end