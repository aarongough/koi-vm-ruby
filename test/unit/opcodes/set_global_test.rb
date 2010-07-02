require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", 'test_helper.rb'))

class SetGlobalTest < Test::Unit::TestCase

  include Koi
  
  test "SET_GLOBAL should set local variable at index to first stack item" do
    vm = VM.new({
      :fibers => [{
        :stack => [2],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      SET_GLOBAL, 0
    ]
    assert_equal [], state[:fibers][0][:stack]
    assert_equal 2, state[:fibers][0][:instruction_pointer]
    assert_equal [2], state[:globals]
  end
  
  test "SET_GLOBAL should raise OperandError if index is not supplied" do
    assert_raises OperandError do
      vm = VM.new({
        :fibers => [{
          :stack => [2],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        SET_GLOBAL
      ]
    end
  end
  
  test "SET_GLOBAL should raise OperandError if index is not an integer" do
    assert_raises OperandError do
      vm = VM.new({
        :fibers => [{
          :stack => [2],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        SET_GLOBAL, "5"
      ]
    end
  end
  
  test "SET_GLOBAL should raise StackError if no items are on the stack" do
    assert_raises StackError do
      VM.new.run [
        SET_GLOBAL, 0
      ]
    end
  end
  
end