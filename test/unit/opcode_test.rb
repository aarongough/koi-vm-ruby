require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class OpcodeTest < Test::Unit::TestCase

  include Koi

  test "invalid opcode should raise RuntimeError" do
    assert_raises RuntimeError do
      VM.new.debug_run [
        101
      ]
    end
  end

  test "no_op should do nothing" do
    state = VM.new.debug_run [
      NO_OP
    ]
    assert_nil state[:registers][REGA]
    assert_nil state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 0, state[:stack].size
  end
  
  test "NO_OP should only skip one instruction" do
    state = VM.new.debug_run [
      NO_OP,
      SET, REGA, "Test"
    ]
    assert_equal "Test", state[:registers][REGA]
    assert_nil state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 0, state[:stack].size
  end
  
  test "should SET REGA" do
    state = VM.new.debug_run [
      SET, REGA, "test"
    ]
    assert_equal "test", state[:registers][REGA]
    assert_nil state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 0, state[:stack].size
  end
  
  test "SET REGA without operand should raise error" do
    assert_raises RuntimeError do
      VM.new.debug_run [
        SET, REGA
      ]
    end
  end
  
  test "should SET REGB" do
    state = VM.new.debug_run [
      SET, REGB, "test"
    ]
    assert_equal "test", state[:registers][REGB]
    assert_nil state[:registers][REGA]
    assert_nil state[:registers][DEBG]
    assert_equal 0, state[:stack].size
  end
  
  test "SET REGB without operand should raise error" do
    assert_raises RuntimeError do
      VM.new.debug_run [
        SET, REGB
      ]
    end
  end
  
  test "SWAP REGA and REGB" do
    state = VM.new.debug_run [
      SET, REGA, "Hello",
      SET, REGB, "world!",
      SWAP, REGA, REGB
    ]
    assert_equal "world!", state[:registers][REGA]
    assert_equal "Hello", state[:registers][REGB]
    assert_nil state[:registers][DEBG]
  end
  
  test "SWAP without operands should raise RuntimeError" do
    assert_raises RuntimeError do
      VM.new.debug_run [
        SET, REGA, "Test",
        SWAP
      ]
    end
  end
  
  test "should PUSH REGA onto stack" do
    state = VM.new.debug_run [
      SET,  REGA, "test",
      PUSH, REGA
    ]
    assert_equal "test", state[:registers][REGA]
    assert_nil state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 1, state[:stack].size
    assert_equal "test", state[:stack].pop
  end
  
  test "should PUSH REGB onto stack" do
    state = VM.new.debug_run [
      SET,  REGB, "test",
      PUSH, REGB
    ]
    assert_equal "test", state[:registers][REGB]
    assert_nil state[:registers][REGA]
    assert_nil state[:registers][DEBG]
    assert_equal 1, state[:stack].size
    assert_equal "test", state[:stack].pop
  end
  
  test "PUSH without operand should raise RuntimeError" do
    assert_raises RuntimeError do
      VM.new.debug_run [
        SET, REGA, "test",
        PUSH
      ]
    end
  end
  
  test "should POP stack onto REGA" do
    state = VM.new.debug_run [
      SET,  REGB, "test",
      PUSH, REGB,
      POP,  REGA
    ]
    assert_equal "test", state[:registers][REGA]
    assert_equal "test", state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 0, state[:stack].size
  end
  
  test "should POP stack onto REGB" do
    state = VM.new.debug_run [
      SET,  REGA, "test",
      PUSH, REGA,
      POP,  REGB
    ]
    assert_equal "test", state[:registers][REGA]
    assert_equal "test", state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 0, state[:stack].size
  end
  
  test "POP without operand should raise RuntimError" do
    assert_raises RuntimeError do
      VM.new.debug_run [
        SET,  REGA, "test",
        PUSH, REGA,
        POP
      ]
    end
  end
  
  test "should PEEK stack onto REGA" do
    state = VM.new.debug_run [
      SET,  REGB, "test",
      PUSH, REGB,
      PEEK, REGA
    ]
    assert_equal "test", state[:registers][REGA]
    assert_equal "test", state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 1, state[:stack].size
  end
  
  test "should PEEK stack onto REGB" do
    state = VM.new.debug_run [
      SET,  REGA, "test",
      PUSH, REGA,
      PEEK, REGB
    ]
    assert_equal "test", state[:registers][REGA]
    assert_equal "test", state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 1, state[:stack].size
  end
  
  test "PEEK without operand should raise RuntimError" do
    assert_raises RuntimeError do
      VM.new.debug_run [
        SET,  REGA, "test",
        PUSH, REGA,
        PEEK
      ]
    end
  end
  
  test "STKSIZE REGA should populate REGA with current stack size" do
    state = VM.new.debug_run [
      SET,     REGA, "test",
      PUSH,    REGA,
      PUSH,    REGA,
      STKSIZE, REGB
    ]
    assert_equal "test", state[:registers][REGA]
    assert_equal 2, state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 2, state[:stack].size
  end
  
  test "STKSIZE REGB should populate REGB with current stack size" do
    state = VM.new.debug_run [
      SET,     REGB, "test",
      PUSH,    REGB,
      PUSH,    REGB,
      STKSIZE, REGA
    ]
    assert_equal "test", state[:registers][REGB]
    assert_equal 2, state[:registers][REGA]
    assert_nil state[:registers][DEBG]
    assert_equal 2, state[:stack].size
  end
  
  test "STKSIZE without operand should raise RuntimeError" do
    assert_raises RuntimeError do
      VM.new.debug_run [
        STKSIZE
      ]
    end
  end
  
  test "PRINT REGA should output REGA to STDOUT" do
    old_stdout = $stdout
    tmp_stdout = StringIO.new
    $stdout = tmp_stdout
    VM.new.debug_run [
      SET, REGA, "Test",
      PRINT, REGA
    ]
    assert_equal "Test\n", tmp_stdout.string
    $stdout = old_stdout
  end
  
  test "PRINT without operand should raise RuntimeError" do
    assert_raises RuntimeError do
      VM.new.debug_run [
        PRINT
      ]
    end
  end
  
  test "JUMP should set instruction_pointer to value in REGA" do
    state = VM.new.debug_run [
      SET, REGA, 9,
      JUMP, REGA,
      SET, REGA, 1,
      NO_OP,
      NO_OP
    ]
    assert_equal 9, state[:registers][REGA]
    assert_nil state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 0, state[:stack].size
  end
  
  test "JUMP should set instruction_pointer to value in REGB" do
    state = VM.new.debug_run [
      SET, REGB, 9,
      JUMP, REGB,
      SET, REGB, 1,
      NO_OP,
      NO_OP
    ]
    assert_equal 9, state[:registers][REGB]
    assert_nil state[:registers][REGA]
    assert_nil state[:registers][DEBG]
    assert_equal 0, state[:stack].size
  end
  
  test "JUMP without operand should raise RuntimeError" do
    assert_raises RuntimeError do
      VM.new.debug_run [
        JUMP
      ]
    end
  end
  
  test "JUMP_IF should set instruction_pointer to value in REGA" do
    state = VM.new.debug_run [
      SET, REGA, 11,
      PUSH, REGA,
      JUMP_IF, REGA,
      SET, REGA, 1,
      NO_OP,
      NO_OP
    ]
    assert_equal 11, state[:registers][REGA]
    assert_nil state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 0, state[:stack].size
  end
  
  test "JUMP_IF should not set instruction_pointer to value in REGA" do
    state = VM.new.debug_run [
      SET, REGA, 14,
      SET, REGB, 0,
      PUSH, REGB,
      JUMP_IF, REGA,
      SET, REGA, 1,
      NO_OP,
      NO_OP
    ]
    assert_equal 1, state[:registers][REGA]
    assert_equal 0, state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 0, state[:stack].size
  end
  
  test "JUMP_IF without operand should raise RuntimeError" do
    assert_raises RuntimeError do
      VM.new.debug_run [
        JUMP_IF
      ]
    end
  end
  
  test "JUMP_UNLESS should set instruction_pointer to value in REGA" do
    state = VM.new.debug_run [
      SET, REGA, 14,
      SET, REGB, 0,
      PUSH, REGB,
      JUMP_UNLESS, REGA,
      SET, REGA, 1,
      NO_OP,
      NO_OP
    ]
    assert_equal 14, state[:registers][REGA]
    assert_equal 0, state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 0, state[:stack].size
  end
  
  test "JUMP_UNLESS should not set instruction_pointer to value in REGA" do
    state = VM.new.debug_run [
      SET, REGA, 11,
      PUSH, REGA,
      JUMP_UNLESS, REGA,
      SET, REGA, 1,
      NO_OP,
      NO_OP
    ]
    assert_equal 1, state[:registers][REGA]
    assert_nil state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 0, state[:stack].size
  end
  
  test "JUMP_UNLESS without operand should raise RuntimeError" do
    assert_raises RuntimeError do
      VM.new.debug_run [
        JUMP_UNLESS
      ]
    end
  end
  
  test "ADD should add top two items on the stack" do
    state = VM.new.debug_run [
      SET, REGA, 2,
      PUSH, REGA,
      PUSH, REGA,
      ADD
    ]
    assert_equal 2, state[:registers][REGA]
    assert_nil state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 1, state[:stack].size
    assert_equal 4, state[:stack].pop
  end
  
  test "ADD should raise RuntimeError if only 1 item is on the stack" do
    assert_raises RuntimeError do
      VM.new.debug_run [
        SET, REGA, 2,
        PUSH, REGA,
        ADD
      ]
    end
  end
  
  test "SUBTRACT should subtract stack[-1] from stack[-2]" do
    state = VM.new.debug_run [
      SET, REGA, 2,
      PUSH, REGA,
      SET, REGA, 1,
      PUSH, REGA,
      ADD
    ]
    assert_equal 1, state[:registers][REGA]
    assert_nil state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 1, state[:stack].size
    assert_equal 1, state[:stack].pop
  end
  
  test "SUBTRACT should subtract stack[-1] from stack[-2] (reverse)" do
    state = VM.new.debug_run [
      SET, REGA, 1,
      PUSH, REGA,
      SET, REGA, 2,
      PUSH, REGA,
      ADD
    ]
    assert_equal 2, state[:registers][REGA]
    assert_nil state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 1, state[:stack].size
    assert_equal -1, state[:stack].pop
  end
  
  test "SUBTRACT should raise RuntimeError if only 1 item is on the stack" do
    assert_raises RuntimeError do
      VM.new.debug_run [
        SET, REGA, 2,
        PUSH, REGA,
        ADD
      ]
    end
  end
  
  test "MULTIPLY should multiply the top two items on the stack" do
    state = VM.new.debug_run [
      SET, REGA, 4,
      PUSH, REGA,
      SET, REGA, 2,
      PUSH, REGA,
      MULTIPLY
    ]
    assert_equal 2, state[:registers][REGA]
    assert_nil state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 1, state[:stack].size
    assert_equal 8, state[:stack].pop
  end
  
  test "MULTIPLY should raise RuntimeError if only 1 item is on the stack" do
    assert_raises RuntimeError do
      VM.new.debug_run [
        SET, REGA, 2,
        PUSH, REGA,
        MULTIPLY
      ]
    end
  end
  
  test "DIVIDE should divide stack[-2] by stack [-1]" do
    state = VM.new.debug_run [
      SET, REGA, 10,
      PUSH, REGA,
      SET, REGA, 2,
      PUSH, REGA,
      DIVIDE
    ]
    assert_equal 2, state[:registers][REGA]
    assert_nil state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 1, state[:stack].size
    assert_equal 5, state[:stack].pop
  end
  
  test "DIVIDE should divide stack[-2] by stack [-1] (reverse)" do
    state = VM.new.debug_run [
      SET, REGA, 2,
      PUSH, REGA,
      SET, REGA, 10,
      PUSH, REGA,
      DIVIDE
    ]
    assert_equal 10, state[:registers][REGA]
    assert_nil state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 1, state[:stack].size
    assert_equal 0.2, state[:stack].pop
  end
  
  test "DIVIDE should raise RuntimeError if only 1 item is on the stack" do
    assert_raises RuntimeError do
      VM.new.debug_run [
        SET, REGA, 2,
        PUSH, REGA,
        DIVIDE
      ]
    end
  end
  
end