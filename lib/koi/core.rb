module Koi
  NO_OP     = 0   # Do nothing
  PUSH      = 1   # Push the content of the register specified onto the stack
  POP       = 2   # Copy the top item on the stack into the specified register, then delete it from the stack
  PEEK      = 3   # Copy the top item on the stack into the specified register
  STKSIZE   = 4   # Set the specified register to equal the number of items on the stack
  SET       = 5   # Set the specified register with the value specified   
  PRINT     = 6   # Print the contents of the specified register to STDOUT
  GOTO      = 7   # Set the instruction pointer to the value in the specified register
  EXIT      = 8   # Exit
  
  REGA = REGISTER_A     = :REGISTER_A
  REGB = REGISTER_B     = :REGISTER_B
  DEBG = DEBUG_REGISTER = :DEBUG_REGISTER

  class VM
    def self.run(opcodes)
      # Initialize the VM
      registers           = {}  # A hashtable to store our registers
      stack               = []  # An array as our stack
      instruction_pointer = 0   # A pointer to the next instruction to be executed
      
      while true
        raise PointerError, "Instruction Pointer ('#{instruction_pointer}') not valid" unless(instruction_pointer.is_a?(Integer))
      
        instruction = opcodes[instruction_pointer]
        operand1    = opcodes[instruction_pointer + 1]
        operand2    = opcodes[instruction_pointer + 2]
      
        case opcodes[instruction_pointer]
        when NO_OP
          instruction_pointer += 1
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
        when PRINT
          puts registers[operand1]
          instruction_pointer += 1
        when GOTO
          instruction_pointer = registers[operand1]
          next
        when EXIT
          return
        end
        
        # Increment our isntruction pointer
        instruction_pointer += 1
      end
    end
  end
end