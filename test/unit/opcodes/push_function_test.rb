require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", 'test_helper.rb'))

class PushFunctionTest < Test::Unit::TestCase

  include Koi
  
  test "PUSH_FUNCTION should instruction_pointer + 1 to the stack and then skip to next end block" do
    state = VM.new.run [
      PUSH_FUNCTION,
      END_FUNCTION
    ]
    assert_equal [1], state[:fibers][0][:stack]
    assert_equal 2, state[:fibers][0][:instruction_pointer]
  end
  
  test "opcodes inside a PUSH_FUNCTION -> END block should not be executed" do
    state = VM.new.run [
      PUSH_FUNCTION,
      PUSH, 10,
      END_FUNCTION
    ]
    assert_equal [1], state[:fibers][0][:stack]
    assert_equal 4, state[:fibers][0][:instruction_pointer]
  end
  
  test "PUSH_FUNCTION without following END should raise RuntimeError" do
    assert_raises RuntimeError do
      VM.new.run [
        PUSH_FUNCTION
      ]
    end
  end
  
end