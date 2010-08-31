module KoiVMRuby
  class VM
    
    @@instruction[HAS_KEY] = Proc.new() do |vm|
      raise StackError, "Expecting at least two items on the data stack" unless(vm.data_stack.length > 1)
      raise StackError, "Expecting a hash" unless(vm.data_stack[-2][0] == HASH_)
      key = vm.data_stack.pop
      hash = vm.data_stack.pop[1]
      if(hash.has_key?(key))
        vm.data_stack.push([BOOL_, true])
      else
        vm.data_stack.push([BOOL_, false])
      end
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end