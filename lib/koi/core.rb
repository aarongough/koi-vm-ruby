module Koi
  class VM
    
    attr_accessor :state, :files
    
    def initialize(state = {}, opcodes = [])
      default_state = {
        :opcodes => opcodes,
        :globals => [],
        :fiber => {
          :data_stack => [],
          :return_stack => [],
          :locals => {},
          :instruction_pointer => 0
        }
      }
      @state = default_state.merge(state)
      @files = {} 
      raise ArgumentError, "state[:fibers][x] must be a hash" unless(@state[:fiber].is_a?(Hash))
      raise ArgumentError, "state[:fibers][x][:stack] must be an Array" unless(@state[:fiber][:data_stack].is_a?(Array))
      raise ArgumentError, "state[:fibers][x][:stack] must be an Array" unless(@state[:fiber][:return_stack].is_a?(Array))
      raise ArgumentError, "state[:fibers][x][:instruction_pointer] must be an Integer" unless(@state[:fiber][:instruction_pointer].is_a?(Integer))
      raise ArgumentError, "state[:globals] must be an array" unless(@state[:globals].is_a?(Array))
      raise ArgumentError, "state[:opcodes] must be an array" unless(@state[:opcodes].is_a?(Array))
    end
  
    def run(opcodes = [])
      @state[:opcodes].concat(opcodes)
      opcode_size = @state[:opcodes].size
      while (@state[:fiber][:instruction_pointer] < opcode_size)
        begin
          break if(send("opcode" + @state[:opcodes][@state[:fiber][:instruction_pointer]].to_s) == true)
        rescue Exception => e
          @state.delete(:opcodes)
          puts "\n\n" + @state.inspect + "\n\n" unless(defined?($test) && $test == true)
          raise 
        end
      end
      
      return @state
    end
    
  end
end