require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class MultiplyTest < Test::Unit::TestCase

  include Koi
  
  test "MULTIPLY should MULTIPLY stack[-2] by stack [-1]" do
    vm = VM.new([{
      :stack => [10,2],
      :instruction_pointer => 0
    }])
    state = vm.run [
      MULTIPLY
    ]
    assert_equal [{
      :stack => [20],
      :instruction_pointer => 1,
    }], state
  end
  
  test "MULTIPLY should raise StackError if only 1 item is on the stack" do
    assert_raises StackError do
      vm = VM.new([{
        :stack => [10],
        :instruction_pointer => 0
      }])
      vm.run [
        MULTIPLY
      ]
    end
  end
  
  test "MULTIPLY should raise StackError if no items are on the stack" do
    assert_raises StackError do
      vm = VM.new([{
        :stack => [],
        :instruction_pointer => 0
      }])
      vm.run [
        MULTIPLY
      ]
    end
  end
  
end