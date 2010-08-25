module KoiVM
  class VM
    
    @@instruction[TAILCALL] = Proc.new() do |vm|
      raise StackError, "Expecting at least one item on the data stack" unless(vm.data_stack.length > 0)
      raise StackError, "Expecting function" unless(vm.data_stack[-1][0] == FUNCTION_)
      vm.instruction_pointer = vm.data_stack.pop[1]
      vm.reload_scope
    end
    
  end
end