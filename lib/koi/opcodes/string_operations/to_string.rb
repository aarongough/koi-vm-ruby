module Koi
  class VM
    
    @@instruction[TO_STRING] = Proc.new() do |vm|
      raise StackError, "Expecting at least one item on the data stack" unless(vm.data_stack.length > 0)
      value = vm.data_stack.pop
      if(value[0] == NIL_)
        vm.data_stack.push([STRING_, "nil"])
      else
        vm.data_stack.push([STRING_, value[1].to_s])
      end
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end