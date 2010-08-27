module KoiVM
  class VM
    
    @@instruction[PUSH_HASH] = Proc.new() do |vm|
      vm.data_stack.push([HASH_, {}])
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end