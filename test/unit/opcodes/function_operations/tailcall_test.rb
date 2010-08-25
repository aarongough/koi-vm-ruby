require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class TailcallTest < Test::Unit::TestCase

  include KoiVM
  
  test "should pass execution to new function without altering return stack, and reload scope" do
    vm = VM.new
    vm.data_stack = [[FUNCTION_, 101]]
    vm.level = 1
    vm.return_stack = [1]
    vm.run [
      TAILCALL
    ]
    assert_equal [], vm.data_stack
    assert_equal [1], vm.return_stack
    assert_equal 101, vm.instruction_pointer
    assert_equal 1, vm.level
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        TAILCALL
      ]
    end
  end
  
  test "should raise StackError if topmost stack item is not a function" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [[INTEGER_, 101]]
      vm.run [
        TAILCALL
      ]
    end
  end

  
end