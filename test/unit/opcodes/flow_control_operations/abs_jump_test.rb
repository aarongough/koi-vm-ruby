require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", "..", 'test_helper.rb'))

class AbsJumpTest < Test::Unit::TestCase

  include Koi
  
  test "ABS_JUMP should add offset to instruction_pointer" do
    vm = VM.new({
      :fibers => [{
        :stack => [3],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      ABS_JUMP
    ]
    assert_equal 3, state[:fibers][0][:instruction_pointer]
  end
  
  test "ABS_JUMP should raise OperandError if offset is not an integer" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => ["3"],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      vm.run [
        ABS_JUMP
      ]
    end
  end
  
  test "ABS_JUMP should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      VM.new.run [
        ABS_JUMP
      ]
    end
  end
  
end