module KoiVMRuby
  class VM
    
    @@instruction[LESS_THAN] = Proc.new() do |vm|
      raise StackError, "Expecting at least two items on the data stack" unless(vm.data_stack.length > 1)
      result = [BOOL_, vm.data_stack[-2][1] < vm.data_stack[-1][1]]
      vm.data_stack.pop
      vm.data_stack.pop
      vm.data_stack.push(result)
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end