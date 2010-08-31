module KoiVMRuby
  class VM
    
    @@instruction[SET_KEY] = Proc.new() do |vm|
      raise StackError, "Expecting at least three items on the data stack" unless(vm.data_stack.length > 2)
      raise StackError, "Expecting a hash" unless(vm.data_stack[-3][0] == HASH_)
      value = vm.data_stack.pop
      key = vm.data_stack.pop
      vm.data_stack[-1][1][key] = value
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end