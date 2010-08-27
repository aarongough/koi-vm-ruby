module KoiVM
  class VM
    
    @@instruction[LENGTH] = Proc.new() do |vm|
      raise StackError, "Expecting at least one item on the data stack" unless(vm.data_stack.length > 0)
      raise StackError, "Expecting a hash" unless(vm.data_stack[-1][0] == HASH_)
      hash = vm.data_stack.pop[1]
      integer_keys = hash.keys.reject{|x| x[0] != INTEGER_ }.map{|x| x[1]}
      highest_key = integer_keys.sort.last
      if(highest_key.nil?)
        vm.data_stack.push([INTEGER_, 0])
      else
        vm.data_stack.push([INTEGER_, highest_key + 1])
      end
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end