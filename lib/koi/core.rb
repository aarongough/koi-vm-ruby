module Koi
  class VM
    
    def initialize(state = nil, opcodes = [])
      if(!state.nil?)
        @state = state
      else
        @state = [{
          :stack => [],
          :instruction_pointer => 0
        }]
      end
      @opcodes = opcodes
      @state_identifier = 0
    end
  
    def run(opcodes = [])
      @opcodes.concat(opcodes)
      while (@state[@state_identifier][:instruction_pointer] < @opcodes.size)
        opcode_name = "opcode" + @opcodes[@state[@state_identifier][:instruction_pointer]].to_s
        if(methods.include?(opcode_name.to_sym))
          break if(send(opcode_name))
        else
          raise RuntimeError, "Invalid opcode: #{@opcodes[@state[@state_identifier][:instruction_pointer]]}"
        end
      end
      
      return @state
    end
    
  end
end