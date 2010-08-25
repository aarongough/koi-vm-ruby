module KoiVM
  class VM
    
    @@instruction[PUSH_NIL] = Proc.new() do |vm|
      vm.data_stack.push([NIL_, nil])
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end