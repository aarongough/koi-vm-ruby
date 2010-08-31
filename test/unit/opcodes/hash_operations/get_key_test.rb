require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class GetKeyTest < Test::Unit::TestCase

  include KoiVMRuby
  
  test "should get key in hash" do
    vm = VM.new
    vm.data_stack = [[HASH_, {[INTEGER_, 1] => [STRING_, "yay"]}], [INTEGER_, 1]]
    vm.run [
      GET_KEY
    ]
    assert_equal [[STRING_, "yay"]], vm.data_stack
    assert_equal 1, vm.instruction_pointer
  end
  
  test "should get unset key in hash" do
    vm = VM.new
    vm.data_stack = [[HASH_, {}], [INTEGER_, 1]]
    vm.run [
      GET_KEY
    ]
    assert_equal [[NIL_, nil]], vm.data_stack
    assert_equal 1, vm.instruction_pointer
  end
  
  test "should raise StackError if stack[-2] is not a hash" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [[INTEGER_, 1], [INTEGER_, 1]]
      vm.run [
        GET_KEY
      ]
    end
  end
  
  test "should raise StackError if there is only 1 item on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [[HASH_, {}]]
      vm.run [
        GET_KEY
      ]
    end
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        GET_KEY
      ]
    end
  end
  
end