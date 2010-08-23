module Koi
  class VM
    
    @@instruction[CONCAT] = Proc.new() do |vm|
      raise StackError, "Expecting at least two items on the data stack" unless(vm.data_stack.length > 1)
      raise StackError, "Expecting at least two strings on the stack" unless((vm.data_stack[-1][0] == STRING_) and (vm.data_stack[-2][0] == STRING_))
      vm.data_stack[-2][1].concat(vm.data_stack.pop[1])
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end