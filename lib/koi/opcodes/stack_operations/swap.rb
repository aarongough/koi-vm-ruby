module Koi
  class VM
    
    @@instruction[SWAP] = Proc.new() do |vm|
      raise StackError, "Expecting at least two items on the data stack" unless(vm.data_stack.length > 1)
      vm.data_stack.insert(-2, vm.data_stack.pop)
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end