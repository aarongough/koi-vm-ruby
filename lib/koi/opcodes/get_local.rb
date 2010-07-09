module Koi
  class VM
    
    # GET_LOCAL
    def opcode17
      fiber = this_fiber
      index = operand(Integer)
      raise RuntimeError, "Accessing unset local at offset #{fiber[:instruction_pointer]}. Index: #{index}" if(fiber[:locals][index].nil?)
      fiber[:stack].push fiber[:locals][index]
      fiber[:instruction_pointer] += 2
    end
    
  end
end