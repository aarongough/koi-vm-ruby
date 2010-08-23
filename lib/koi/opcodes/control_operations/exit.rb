module Koi
  class VM
    
    @@instruction[EXIT] = Proc.new() do |vm|
      vm.instruction_pointer = vm.instruction_pointer + 1
      true
    end
    
  end
end