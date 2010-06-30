require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class JumpTest < Test::Unit::TestCase

  include Koi
  
  test "JUMP should add offset to instruction_pointer" do
    vm = VM.new([{
      :stack => [],
      :instruction_pointer => 0
    }])
    state = vm.run [
      JUMP, 5
    ]
    assert_equal [{
      :stack => [],
      :instruction_pointer => 5
    }], state
  end
  
  test "JUMP should raise OperandError if offset is not an integer" do
    assert_raises OperandError do
      VM.new.run [
        JUMP, "5"
      ]
    end
  end
  
  test "JUMP should raise StackError if no operand is supplied" do
    assert_raises RuntimeError do
      VM.new.run [
        JUMP
      ]
    end
  end
  
end