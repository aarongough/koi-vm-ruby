module KoiVMRuby
  class VM
    
    @@instruction[EQUAL] = Proc.new() do |vm|
      raise StackError, "Expecting at least two items on the data stack" unless(vm.data_stack.length > 1)
      vm.data_stack.push([BOOL_, vm.data_stack.pop == vm.data_stack.pop])
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end