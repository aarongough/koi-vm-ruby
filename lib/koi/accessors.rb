module Koi
  class VM
  
    def data_stack
      return @state[:fiber][:data_stack]
    end
    
    def data_stack=(stack)
      @state[:fiber][:data_stack] = stack
    end
    
    def return_stack
      return @state[:fiber][:return_stack]
    end
    
    def return_stack=(stack)
      @state[:fiber][:return_stack] = stack
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
    
    def locals
      return @state[:fiber][:locals][@state[:fiber][:level]]
    end
    
    def globals
      return @state[:globals]
    end
    
    def increment_scope
      @state[:fiber][:level] += 1
      @state[:fiber][:locals][@state[:fiber][:level]] = @state[:fiber][:locals][@state[:fiber][:level] - 1].dup
    end
    
    def decrement_scope
      @state[:fiber][:locals].delete_at(@state[:fiber][:level])
      @state[:fiber][:level] -= 1
    end
    
    def reload_scope
      @state[:fiber][:locals][@state[:fiber][:level]] = {}
    end
    
    def level
      return @state[:fiber][:level]
    end
  
  end
end