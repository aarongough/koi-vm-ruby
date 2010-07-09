module Koi
  class VM
    
    # DIVIDE
    def opcode11
      expect_stack_size(2)
      fiber = this_fiber
      right_operand = fiber[:stack].pop
      left_operand = fiber[:stack].pop
      fiber[:stack].push(left_operand / right_operand)
      fiber[:instruction_pointer] += 1
    end
    
  end
end