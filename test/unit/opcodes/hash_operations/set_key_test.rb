require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class SetKeyTest < Test::Unit::TestCase

  include KoiVMRuby
  
  test "should set key in hash" do
    vm = VM.new
    vm.data_stack = [[HASH_, {}], [INTEGER_, 1], [STRING_, "yay"]]
    vm.run [
      SET_KEY
    ]
    assert_equal [[HASH_, {[INTEGER_, 1] => [STRING_, "yay"]}]], vm.data_stack
    assert_equal 1, vm.instruction_pointer
  end
  
  test "should raise StackError if stack[-3] is not a hash" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [[INTEGER_, 1], [INTEGER_, 1], [STRING_, "yay"]]
      vm.run [
        SET_KEY
      ]
    end
  end
  
  test "should raise StackError if there are only 2 items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [[HASH_, {}], [INTEGER_, 1]]
      vm.run [
        SET_KEY
      ]
    end
  end
  
  test "should raise StackError if there is only 1 item on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [[HASH_, {}]]
      vm.run [
        SET_KEY
      ]
    end
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        SET_KEY
      ]
    end
  end
  
end