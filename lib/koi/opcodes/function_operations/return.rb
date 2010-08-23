module Koi
  class VM
    
    @@instruction[RETURN] = Proc.new() do |vm|
      raise ReturnStackError, "Expecting at least one item on the return stack" unless(vm.return_stack.length > 0)
      vm.instruction_pointer = vm.return_stack.pop
      vm.decrement_scope
    end
    
  end
end