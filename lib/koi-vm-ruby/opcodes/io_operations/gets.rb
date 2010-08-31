module KoiVMRuby
  class VM
    
    @@instruction[GETS] = Proc.new() do |vm|
      vm.data_stack.push([STRING_, $stdin.gets("\n")])
      vm.instruction_pointer = vm.instruction_pointer + 1
    end
    
  end
end