module Koi
  class VM
    
    attr_accessor :state
    
    def initialize(state = {}, opcodes = [])
      default_state = {
        :opcodes => [],
        :fiber_id => 0,
        :globals => [],
        :fibers => [{
          :stack => [],
          :locals => [],
          :instruction_pointer => 0
        }]
      }
      @state = default_state.merge(state)    
      raise ArgumentError, "state[:fibers][x] must be a hash" if(@state[:fibers].map{|x| x.is_a?(Hash)}.include?(false))
      raise ArgumentError, "state[:fibers][x][:stack] must be an Array" if(@state[:fibers].map{|x| x[:stack].is_a?(Array)}.include?(false))
      raise ArgumentError, "state[:fibers][x][:instruction_pointer] must be an Integer" if(@state[:fibers].map{|x| x[:instruction_pointer].is_a?(Integer)}.include?(false))
      raise ArgumentError, "state[:globals] must be an array" unless(@state[:globals].is_a?(Array))
      raise ArgumentError, "state[:opcodes] must be an array" unless(@state[:opcodes].is_a?(Array))
      raise ArgumentError, "state[:fiber_id] must be an integer" unless(@state[:fiber_id].is_a?(Integer))
    end
  
    def run(opcodes = [])
      @state[:opcodes].concat(opcodes)
      while (@state[:fibers][@state[:fiber_id]][:instruction_pointer] < @state[:opcodes].size)
        opcode_name = "opcode" + @state[:opcodes][@state[:fibers][@state[:fiber_id]][:instruction_pointer]].to_s
        if(methods.include?(opcode_name.to_sym))
          break if(send(opcode_name) == true)
        else
          raise RuntimeError, "Invalid opcode: #{@state[:opcodes][@state[:fibers][@state[:fiber_id]][:instruction_pointer]]}"
        end
      end
      
      return @state
    end
    
  end
end