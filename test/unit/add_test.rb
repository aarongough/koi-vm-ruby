require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class AddTest < Test::Unit::TestCase

  include Koi
  
  test "ADD should add top two items on the stack" do
    vm = VM.new([{
      :stack => [2, 2],
      :instruction_pointer => 0
    }])
    state = vm.run [
      ADD
    ]
    assert_equal [{
      :stack => [4],
      :instruction_pointer => 1
    }], state
  end
  
  test "ADD should raise StackError if only 1 item is on the stack" do
    assert_raises StackError do
      vm = VM.new([{
        :stack => [2],
        :instruction_pointer => 0
      }])
      vm.run [
        ADD
      ]
    end
  end
  
  test "ADD should raise StackError if no items are on the stack" do
    assert_raises StackError do
      vm = VM.new([{
        :stack => [],
        :instruction_pointer => 0
      }])
      vm.run [
        ADD
      ]
    end
  end
  
end