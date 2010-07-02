require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", 'test_helper.rb'))

class PushTest < Test::Unit::TestCase

  include Koi
  
  test "PUSH should add item to stack" do
    state = VM.new.run [
      PUSH, "Hello"
    ]
    assert_equal ["Hello"], state[:fibers][0][:stack]
    assert_equal 2, state[:fibers][0][:instruction_pointer]
  end
  
  test "PUSH without operand should raise OperandError" do
    assert_raises OperandError do
      VM.new.run [
        PUSH
      ]
    end
  end
  
end