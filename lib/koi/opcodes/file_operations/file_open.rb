module Koi
  class VM
    
    # FILE_OPEN
    def opcode25
      expect_stack_size(2)
      fiber = this_fiber
      mode = fiber[:stack].pop
      descriptor = fiber[:stack].pop
      if(descriptor.is_a?(String))
        descriptor = IO.sysopen(descriptor, mode)
      elsif(!descriptor.is_a?(Integer))
        raise StackError, "Unknown file descriptor type in FILE_OPEN at offset: #{fiber[:instruction_pointer]}"
      end
      io = IO.new(descriptor)
      @files[io.fileno] = io
      fiber[:stack].push io.fileno
      fiber[:instruction_pointer] += 1
    end
    
  end
end