require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class JumpIfTest < Test::Unit::TestCase

  include Koi
  
  test "JUMP_IF should add offset to instruction_pointer if topmost stack item evaluates to true" do
    vm = VM.new([{
      :stack => [1],
      :instruction_pointer => 0
    }])
    state = vm.run [
      JUMP_IF, 5
    ]
    assert_equal [{
      :stack => [],
      :instruction_pointer => 5
    }], state
  end
  
  test "JUMP_IF should not add offset to instruction_pointer if topmost stack item does not evaluate to true" do
    vm = VM.new([{
      :stack => [0],
      :instruction_pointer => 0
    }])
    state = vm.run [
      JUMP_IF, 5
    ]
    assert_equal [{
      :stack => [],
      :instruction_pointer => 2
    }], state
  end
  
  test "JUMP_IF should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      VM.new.run [
        JUMP_IF, 5
      ]
    end
  end
  
  test "JUMP_IF should raise OperandError if it is not supplied an operand" do
    assert_raises OperandError do
      vm = VM.new([{
        :stack => [1],
        :instruction_pointer => 0
      }])      
      vm.run [
        JUMP_IF
      ]
    end
  end
  
  test "JUMP_IF should raise OperandError if offset is not an integer" do
    assert_raises OperandError do
      vm = VM.new([{
        :stack => [1],
        :instruction_pointer => 0
      }])
      vm.run [
        JUMP_IF, "5"
      ]
    end
  end
  
end