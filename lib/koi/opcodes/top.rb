module Koi
  class VM
    
    # TOP
    def opcode15
      slice_size = operand(Integer)
      expect_stack_size(slice_size)
      fiber = this_fiber
      fiber[:stack].concat(fiber[:stack][slice_size - slice_size - slice_size, fiber[:stack].size])
      fiber[:instruction_pointer] += 2
    end
    
  end
end