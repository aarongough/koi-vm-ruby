module Koi
  class VM
    
    # INPUT
    def opcode13
      input = gets
      @state[@state_identifier][:stack].push input unless(input.nil?)
      @state[@state_identifier][:instruction_pointer] += 1
    end    
    
  end
end