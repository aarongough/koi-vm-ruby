module Koi
  NO_OP       = 0   # Do nothing
  PUSH        = 1   # Push the content of the register specified onto the stack
  POP         = 2   # Copy the top item on the stack into the specified register, then delete it from the stack
  PEEK        = 3   # Copy the top item on the stack into the specified register
  STKSIZE     = 4   # Set the specified register to equal the number of items on the stack
  SET         = 5   # Set the specified register with the value specified   
  SWAP        = 6   # Swap the content of the two specified registers
  PRINT       = 7   # Print the contents of the specified register to STDOUT
  JUMP        = 8   # Set the instruction pointer to the value in the specified register
  JUMP_IF     = 9   # Set the instruction pointer to the value in the first register if the second register is greater than zero
  JUMP_UNLESS = 10  # Set the instruction pointer to the value in the first register unless the second register is greater than zero
  EXIT        = 11  # Exit
  
  REGA = REGISTER_A     = :REGISTER_A
  REGB = REGISTER_B     = :REGISTER_B
  REGC = REGISTER_C     = :REGISTER_C
  REGD = REGISTER_D     = :REGISTER_D
  DEBG = DEBUG_REGISTER = :DEBUG_REGISTER

  class VM
    def self.run(opcodes, debug = false)
      # Initialize the VM
      registers           = {}  # A hashtable to store our registers
      stack               = []  # An array as our stack
      instruction_pointer = 0   # A pointer to the next instruction to be executed
      
      while (instruction_pointer < opcodes.size)
        raise PointerError, "Instruction Pointer ('#{instruction_pointer}') not valid" unless(instruction_pointer.is_a?(Integer))
      
        instruction = opcodes[instruction_pointer]
        operand1    = opcodes[instruction_pointer + 1]
        operand2    = opcodes[instruction_pointer + 2]
      
        case opcodes[instruction_pointer]
        when NO_OP
          instruction_pointer += 1
          next
        when PUSH
          stack.push registers[operand1]
          instruction_pointer += 1
        when POP
          registers[operand1] = stack.pop
          instruction_pointer += 1
        when PEEK
          registers[operand1] = stack[-1]
          instruction_pointer += 1
        when STKSIZE
          registers[operand1] = stack.size
          instruction_pointer += 1
        when SET
          registers[operand1] = operand2
          instruction_pointer += 2
        when SWAP  
          tmp = registers[operand1]
          registers[operand1] = registers[operand2]
          registers[operand2] = tmp
          instruction_pointer += 2
        when PRINT
          puts registers[operand1]
          instruction_pointer += 1
        when JUMP
          instruction_pointer = registers[operand1]
          next
        when JUMP_IF
          if(registers[operand2] > 0)
            instruction_pointer = registers[operand1] 
            next
          end
        when JUMP_UNLESS
          unless(registers[operand2] > 0)
            instruction_pointer = registers[operand1]
            next
          end
        when EXIT
          return
        end
        
        # Increment our isntruction pointer
        instruction_pointer += 1
      end
    ensure  
      return {:registers => registers, :stack => stack, :instruction_pointer => instruction_pointer } if(debug == true)
    end
    
    def self.debug_run(opcodes)
      return self.run(opcodes, true)
    end
  end
end