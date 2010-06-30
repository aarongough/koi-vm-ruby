module Koi
  class VM
    
    # PRINT
    def opcode4
      raise StackError, "PRINT: Nothing on stack at offset: #{@state[@state_identifier][:instruction_pointer]}" if(@state[@state_identifier][:stack].size == 0)
      puts @state[@state_identifier][:stack].pop
      @state[@state_identifier][:instruction_pointer] += 1
    end
    
  end
end