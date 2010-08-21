module Koi
  class VM
  
    def data_stack
      return @state[:fiber][:data_stack]
    end
    
    def data_stack=(stack)
      @state[:fiber][:data_stack] = stack
    end
    
    def instruction_pointer
      return @state[:fiber][:instruction_pointer]
    end
    
    def instruction_pointer=(ip)
      @state[:fiber][:instruction_pointer] = ip
    end
    
    def opcodes
      return @state[:opcodes]
    end
  
  end
end