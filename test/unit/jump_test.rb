require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class JumpTest < Test::Unit::TestCase

  include Koi
  
  test "JUMP should add offset to instruction_pointer" do
    vm = VM.new([{
      :stack => [],
      :instruction_pointer => 0
    }])
    state = vm.run [
      JUMP, "5"
    ]
    assert_equal [{
      :stack => [],
      :instruction_pointer => 6
    }], state
  end
  
  test "JUMP should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      VM.new.run [
        JUMP, "5"
      ]
    end
  end
  
end