module Koi
  class VM
    
    # POP
    def opcode2
      raise StackError, "POP: Nothing on stack at offset: #{@state[@state_identifier][:instruction_pointer]}" if(@state[@state_identifier][:stack].pop.nil?)
      @state[@state_identifier][:instruction_pointer] += 1
    end
    
  end
end