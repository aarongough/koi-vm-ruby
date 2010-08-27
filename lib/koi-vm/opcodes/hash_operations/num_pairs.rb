module KoiVM
  class VM
    
    @@instruction[NUM_PAIRS] = Proc.new() do |vm|
      raise StackError, "Expecting at least one item on the data stack" unless(vm.data_stack.length > 0)
      raise StackError, "Expecting a hash" unless(vm.data_stack[-1][0] == HASH_)
      vm.data_stack.push([INTEGER_, vm.data_stack.pop[1].length ])
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end