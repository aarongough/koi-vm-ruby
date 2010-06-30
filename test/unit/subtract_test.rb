require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class SubtractTest < Test::Unit::TestCase

  include Koi
  
  test "SUBTRACT should SUBTRACT stack[-2] from stack [-1]" do
    vm = VM.new([{
      :stack => [10,2],
      :instruction_pointer => 0
    }])
    state = vm.run [
      SUBTRACT
    ]
    assert_equal [{
      :stack => [8],
      :instruction_pointer => 1,
    }], state
  end
  
  test "SUBTRACT should SUBTRACT stack[-2] from stack [-1] (reverse)" do
    vm = VM.new([{
      :stack => [2,10],
      :instruction_pointer => 0
    }])
    state = vm.run [
      SUBTRACT
    ]
    assert_equal [{
      :stack => [-8],
      :instruction_pointer => 1,
    }], state
  end
  
  test "SUBTRACT should raise StackError if only 1 item is on the stack" do
    assert_raises StackError do
      vm = VM.new([{
        :stack => [10],
        :instruction_pointer => 0
      }])
      vm.run [
        SUBTRACT
      ]
    end
  end
  
  test "SUBTRACT should raise StackError if no items are on the stack" do
    assert_raises StackError do
      vm = VM.new([{
        :stack => [],
        :instruction_pointer => 0
      }])
      vm.run [
        SUBTRACT
      ]
    end
  end
  
end