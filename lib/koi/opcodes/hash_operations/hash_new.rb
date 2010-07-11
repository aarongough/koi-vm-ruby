module Koi
  class VM
    
    # HASH_NEW
    def opcode180
      fiber = this_fiber
      fiber[:stack].push Hash.new
      fiber[:instruction_pointer] += 1
    end
    
  end
end