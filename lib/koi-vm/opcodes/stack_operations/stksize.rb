module KoiVM
  class VM
    
    @@instruction[STKSIZE] = Proc.new() do |vm|
      vm.data_stack.push([INTEGER_, vm.data_stack.length])
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end