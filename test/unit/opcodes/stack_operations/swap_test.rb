require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class SwapTest < Test::Unit::TestCase

  include KoiVM
  
  test "should swap the two topmost items on the data stack" do
    vm = VM.new
    vm.data_stack = [1,2]
    vm.run [
      SWAP
    ]
    assert_equal [2,1], vm.data_stack
    assert_equal 1, vm.instruction_pointer
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        SWAP
      ]
    end
  end
  
  test "should raise StackError if there are less than 2 items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [1]
      vm.run [
        SWAP
      ]
    end
  end
  
end