require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class HasKeyTest < Test::Unit::TestCase

  include KoiVM
  
  test "should return true as hash has key" do
    vm = VM.new
    vm.data_stack = [[HASH_, {[INTEGER_, 1] => [STRING_, "yay"]}], [INTEGER_, 1]]
    vm.run [
      HAS_KEY
    ]
    assert_equal [[BOOL_, true]], vm.data_stack
    assert_equal 1, vm.instruction_pointer
  end
  
  test "should return false as hash does not have key" do
    vm = VM.new
    vm.data_stack = [[HASH_, {}], [INTEGER_, 1]]
    vm.run [
      HAS_KEY
    ]
    assert_equal [[BOOL_, false]], vm.data_stack
    assert_equal 1, vm.instruction_pointer
  end
  
  test "should raise StackError if stack[-2] is not a hash" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [[INTEGER_, 1], [INTEGER_, 1]]
      vm.run [
        HAS_KEY
      ]
    end
  end
  
  test "should raise StackError if there is only 1 item on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [[HASH_, {}]]
      vm.run [
        HAS_KEY
      ]
    end
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        HAS_KEY
      ]
    end
  end
  
end