require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", 'test_helper.rb'))

class RelJumpTest < Test::Unit::TestCase

  include Koi
  
  test "REL_JUMP should add offset to instruction_pointer" do
    state = VM.new.run [
      REL_JUMP, 5
    ]
    assert_equal 5, state[:fibers][0][:instruction_pointer]
  end
  
  test "REL_JUMP should raise OperandError if offset is not an integer" do
    assert_raises OperandError do
      VM.new.run [
        REL_JUMP, "5"
      ]
    end
  end
  
  test "REL_JUMP should raise OperandError if no operand is supplied" do
    assert_raises OperandError do
      VM.new.run [
        REL_JUMP
      ]
    end
  end
  
end