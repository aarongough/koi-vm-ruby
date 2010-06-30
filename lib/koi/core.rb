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
    end
  
    def run(opcodes = [])
      @opcodes.concat(opcodes)
      while (@state[0][:instruction_pointer] < @opcodes.size)
        
      end
    ensure  
      return @state
    end
    
  end
end