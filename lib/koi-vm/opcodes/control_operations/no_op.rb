module KoiVM
  class VM
    
    @@instruction[NO_OP] = Proc.new() do |vm|
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end