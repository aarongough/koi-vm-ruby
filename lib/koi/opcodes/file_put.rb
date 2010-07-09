module Koi
  class VM
    
    # FILE_PUT
    def opcode26
      expect_stack_size(2)
      fiber = this_fiber
      write_length = 0
      begin
        write_length = @files[fiber[:stack][-2]].write_nonblock(fiber[:stack][-1])
      rescue NoMethodError, Errno::EBADF
        raise StackError, "File descriptor '#{fiber[:stack][-2]}' is invalid. At offset: #{fiber[:instruction_pointer]}"
      rescue Errno::EAGAIN, Errno::EINTR
        @state[:fiber_id] += 1
        while(@state[:fibers][@state[:fiber_id]].nil?)
          @state[:fiber_id] += 1
          @state[:fiber_id] = 0 if(@state[:fiber_id] > @state[:fibers].size)
        end
        return
      end
      if( write_length < fiber[:stack][-1].size)
        fiber[:stack][-1].slice!(0, write_length)
      else
        fiber[:stack].pop
        fiber[:stack].pop
        
        fiber[:instruction_pointer] += 1
      end
    end
    
  end
end