module Koi
  class VM
    
    attr_accessor :state
    
    def initialize(state = nil, opcodes = [])
      if(!state.nil?)
        raise ArgumentError, "initial state must contain at least one thread state" unless(state.size > 0)
        raise ArgumentError, "thread state must be a hash" if(state.map{|x| x.is_a?(Hash)}.include?(false))
        raise ArgumentError, "thread state must include stack" if(state.map{|x| x.has_key?(:stack)}.include?(false))
        raise ArgumentError, "thread state must include stack" if(state.map{|x| x.has_key?(:instruction_pointer)}.include?(false))
        raise ArgumentError, "stack must be an array" if(state.map{|x| x[:stack].is_a?(Array)}.include?(false))
        raise ArgumentError, "instruction_pointer must be an integer" if(state.map{|x| x[:instruction_pointer].is_a?(Integer)}.include?(false))
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
          break if(send(opcode_name) == true)
        else
          raise RuntimeError, "Invalid opcode: #{@opcodes[@state[@state_identifier][:instruction_pointer]]}"
        end
      end
      
      return @state
    end
    
  end
end