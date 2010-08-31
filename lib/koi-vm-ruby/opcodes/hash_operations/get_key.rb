module KoiVMRuby
  class VM
    
    @@instruction[GET_KEY] = Proc.new() do |vm|
      raise StackError, "Expecting at least two items on the data stack" unless(vm.data_stack.length > 1)
      raise StackError, "Expecting a hash" unless(vm.data_stack[-2][0] == HASH_)
      key = vm.data_stack.pop
      vm.data_stack.push( vm.data_stack.pop[1][key] )
      vm.data_stack[-1] = [NIL_, nil] if(vm.data_stack[-1] == nil)
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end