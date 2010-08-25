module KoiVM
  class VM
    
    @@instruction[CALL] = Proc.new() do |vm|
      raise StackError, "Expecting at least one item on the data stack" unless(vm.data_stack.length > 0)
      raise StackError, "Expecting function" unless(vm.data_stack[-1][0] == FUNCTION_)
      vm.return_stack.push( vm.instruction_pointer + 1 )
      vm.instruction_pointer = vm.data_stack.pop[1]
      vm.increment_scope
    end
    
  end
end