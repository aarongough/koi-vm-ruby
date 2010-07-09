module Koi
  class VM
    
    # CALL
    def opcode31
      expect_stack_size(1)
      fiber = this_fiber
      target = fiber[:stack].pop
      raise RuntimeError, "No function at: #{target - 1}, got: #{@state[:opcodes][target - 1]}" unless(@state[:opcodes][target - 1] == PUSH_FUNCTION)
      fiber[:stack].push(fiber[:instruction_pointer] + 1)
      fiber[:instruction_pointer] = target
    end
    
  end
end