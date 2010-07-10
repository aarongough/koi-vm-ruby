require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", "..", 'test_helper.rb'))

class JumpUnlessTest < Test::Unit::TestCase

  include Koi
  
  test "JUMP_UNLESS should add offset to instruction_pointer if topmost stack item evaluates to false" do
    vm = VM.new({
      :fibers => [{
        :stack => [-1],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      JUMP_UNLESS, 5
    ]
    assert_equal 5, state[:fibers][0][:instruction_pointer]
  end
  
  test "JUMP_UNLESS should not add offset to instruction_pointer if topmost stack item does not evaluate to false" do
    vm = VM.new({
      :fibers => [{
        :stack => [0],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      JUMP_UNLESS, 5
    ]
    assert_equal 2, state[:fibers][0][:instruction_pointer]
  end
  
  test "JUMP_UNLESS should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      VM.new.run [
        JUMP_UNLESS, 5
      ]
    end
  end
  
  test "JUMP_UNLESS should raise OperandError if it is not supplied an operand" do
    assert_raises OperandError do
      vm = VM.new({
        :fibers => [{
          :stack => [0],
          :locals => [],
          :instruction_pointer => 0
        }]
      })     
      vm.run [
        JUMP_UNLESS
      ]
    end
  end
  
  test "JUMP_UNLESS should raise OperandError if offset is not an integer" do
    assert_raises OperandError do
      vm = VM.new({
        :fibers => [{
          :stack => [0],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      vm.run [
        JUMP_UNLESS, "5"
      ]
    end
  end
  
end