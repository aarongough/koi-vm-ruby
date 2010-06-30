module Koi
  class VM
    
    # DUP
    def opcode12
      raise StackError, "DUP: Nothing on stack at offset: #{@state[@state_identifier][:instruction_pointer]}" if(@state[@state_identifier][:stack].size == 0)
      @state[@state_identifier][:stack].push(@state[@state_identifier][:stack][-1])
      @state[@state_identifier][:instruction_pointer] += 1
    end
    
  end
end