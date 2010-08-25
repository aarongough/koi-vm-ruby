module KoiVM
  class VM
    
    @@instruction[POP] = Proc.new() do |vm|
      raise StackError, "Expecting at least one item on the data stack" unless(vm.data_stack.length > 0)
      vm.data_stack.pop
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end