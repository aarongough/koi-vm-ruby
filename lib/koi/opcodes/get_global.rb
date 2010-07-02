module Koi
  class VM
    
    # GET_GLOBAL
    def opcode19
      fiber = this_fiber
      index = operand(Integer)
      raise RuntimeError, "Accessing unset global at offset #{fiber[:instruction_pointer]}. Index: #{index}" if(@state[:globals][index].nil?)
      fiber[:stack].push @state[:globals][index]
      fiber[:instruction_pointer] += 2
    end
    
  end
end