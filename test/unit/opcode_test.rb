require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class OpcodeTest < Test::Unit::TestCase

  include Koi

  test "invalid opcode should raise RuntimeError" do
    assert_raises RuntimeError do
      VM.debug_run [
        101
      ]
    end
  end

  test "no_op should do nothing" do
    state = VM.debug_run [
      NO_OP
    ]
    assert_nil state[:registers][REGA]
    assert_nil state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 0, state[:stack].size
  end
  
  test "NO_OP should only skip one instruction" do
    state = VM.debug_run [
      NO_OP,
      SET, REGA, "Test"
    ]
    assert_equal "Test", state[:registers][REGA]
    assert_nil state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 0, state[:stack].size
  end
  
  test "should SET REGA" do
    state = VM.debug_run [
      SET, REGA, "test"
    ]
    assert_equal "test", state[:registers][REGA]
    assert_nil state[:registers][REGB]
    assert_nil state[:registers][DEBG]
    assert_equal 0, state[:stack].size
  end
  
  test "SET REGA without operand should raise error" do
    assert_raises RuntimeError do
      VM.debug_run [
        SET, REGA
      ]
    end
  end
  
  test "should SET REGB" do
    state = VM.debug_run [
      SET, REGB, "test"
    ]
    assert_equal "test", state[:registers][REGB]
    assert_nil state[:registers][REGA]
    assert_nil state[:registers][DEBG]
    assert_equal 0, state[:stack].size
  end
  
  test "SET REGB without operand should raise error" do
    assert_raises RuntimeError do
      VM.debug_run [
        SET, REGB
      ]
    end
  end
  
  test "SWAP REGA and REGB" do
    state = VM.debug_run [
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
      VM.debug_run [
        SET, REGA, "Test",
        SWAP
      ]
    end
  end
  
  test "should PUSH REGA onto stack" do
    state = VM.debug_run [
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
    state = VM.debug_run [
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
      VM.debug_run [
        SET, REGA, "test",
        PUSH
      ]
    end
  end
  
  test "should POP stack onto REGA" do
    state = VM.debug_run [
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
    state = VM.debug_run [
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
      VM.debug_run [
        SET,  REGA, "test",
        PUSH, REGA,
        POP
      ]
    end
  end
  
  test "should PEEK stack onto REGA" do
    state = VM.debug_run [
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
    state = VM.debug_run [
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
      VM.debug_run [
        SET,  REGA, "test",
        PUSH, REGA,
        PEEK
      ]
    end
  end
  
  test "STKSIZE REGA should populate REGA with current stack size" do
    state = VM.debug_run [
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
    state = VM.debug_run [
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
      VM.debug_run [
        STKSIZE
      ]
    end
  end
  
  test "PRINT REGA should output REGA to STDOUT" do
    old_stdout = $stdout
    tmp_stdout = StringIO.new
    $stdout = tmp_stdout
    VM.debug_run [
      SET, REGA, "Test",
      PRINT, REGA
    ]
    assert_equal "Test\n", tmp_stdout.string
    $stdout = old_stdout
  end
  
  test "PRINT without operand should raise RuntimeError" do
    assert_raises RuntimeError do
      VM.debug_run [
        PRINT
      ]
    end
  end
  
  test "JUMP should set instruction_pointer to value in REGA" do
    state = VM.debug_run [
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
    state = VM.debug_run [
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
      VM.debug_run [
        JUMP
      ]
    end
  end
  
  test "JUMP_IF should set instruction_pointer to value in REGA" do
    state = VM.debug_run [
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
    state = VM.debug_run [
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
      VM.debug_run [
        JUMP_IF
      ]
    end
  end
  
  test "JUMP_UNLESS should set instruction_pointer to value in REGA" do
    state = VM.debug_run [
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
    state = VM.debug_run [
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
      VM.debug_run [
        JUMP_UNLESS
      ]
    end
  end
  
end