module Koi
  class VM
    
    # PUSH_FUNCTION
    def opcode29
      fiber = this_fiber
      fiber[:stack].push(fiber[:instruction_pointer] + 1)
      while(@state[:opcodes][fiber[:instruction_pointer]] != END_FUNCTION) do
        fiber[:instruction_pointer] += 1
        raise RuntimeError, "PUSH_FUNCTION missing matching END_FUNCTION" if(fiber[:instruction_pointer] > @state[:opcodes].length)
      end
      fiber[:instruction_pointer] += 1
    end
    
  end
end