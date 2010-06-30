require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class JumpUnlessTest < Test::Unit::TestCase

  include Koi
  
  test "JUMP_UNLESS should add offset to instruction_pointer if topmost stack item evaluates to false" do
    vm = VM.new([{
      :stack => [0],
      :instruction_pointer => 0
    }])
    state = vm.run [
      JUMP_UNLESS, "5"
    ]
    assert_equal [{
      :stack => [],
      :instruction_pointer => 6
    }], state
  end
  
  test "JUMP_UNLESS should not add offset to instruction_pointer if topmost stack item does not evaluate to false" do
    vm = VM.new([{
      :stack => [1],
      :instruction_pointer => 0
    }])
    state = vm.run [
      JUMP_UNLESS, "5"
    ]
    assert_equal [{
      :stack => [],
      :instruction_pointer => 1
    }], state
  end
  
  test "JUMP_UNLESS should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      VM.new.run [
        JUMP_UNLESS, "5"
      ]
    end
  end
  
end