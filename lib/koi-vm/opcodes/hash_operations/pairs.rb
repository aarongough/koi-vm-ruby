module KoiVM
  class VM
    
    @@instruction[PAIRS] = Proc.new() do |vm|
      raise StackError, "Expecting at least one item on the data stack" unless(vm.data_stack.length > 0)
      raise StackError, "Expecting a hash" unless(vm.data_stack[-1][0] == HASH_)
      hash = vm.data_stack.pop[1]
      hashed_hash = {}
      index = 0
      hash.each_pair do |k,v|
        hashed_hash[[INTEGER_, index]] = [HASH_, {
          [INTEGER_, 0] => k,
          [INTEGER_, 1] => v
        }]
        index += 1
      end
      vm.data_stack.push([HASH_, hashed_hash])
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end