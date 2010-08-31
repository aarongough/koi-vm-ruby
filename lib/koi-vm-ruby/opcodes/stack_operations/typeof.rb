module KoiVMRuby
  class VM
    
    @@instruction[TYPEOF] = Proc.new() do |vm|
      raise StackError, "Expecting at least one item on the data stack" unless(vm.data_stack.length > 0)
      value = vm.data_stack.pop
      vm.data_stack.push([STRING_, "nil"]) if(value[0] == NIL_)
      vm.data_stack.push([STRING_, "bool"]) if(value[0] == BOOL_)
      vm.data_stack.push([STRING_, "integer"]) if(value[0] == INTEGER_)
      vm.data_stack.push([STRING_, "float"]) if(value[0] == FLOAT_)
      vm.data_stack.push([STRING_, "string"]) if(value[0] == STRING_)
      vm.data_stack.push([STRING_, "hash"]) if(value[0] == HASH_)
      vm.data_stack.push([STRING_, "function"]) if(value[0] == FUNCTION_)
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end