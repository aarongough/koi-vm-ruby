require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class LengthTest < Test::Unit::TestCase

  include KoiVM
  
  test "should return value of highest integer key + 1" do
    vm = VM.new
    vm.data_stack = [[HASH_, {[INTEGER_, 1] => [STRING_, "yay"], [INTEGER_, 2] => [STRING_, "yay"], [INTEGER_, 6] => [STRING_, "yay"]}]]
    vm.run [
      LENGTH
    ]
    assert_equal [[INTEGER_, 7]], vm.data_stack
    assert_equal 1, vm.instruction_pointer
  end
  
  test "should return 0" do
    vm = VM.new
    vm.data_stack = [[HASH_, {[STRING_, "1"] => [STRING_, "yay"], [STRING_, "2"] => [STRING_, "yay"], [STRING_, "3"] => [STRING_, "yay"]}]]
    vm.run [
      LENGTH
    ]
    assert_equal [[INTEGER_, 0]], vm.data_stack
    assert_equal 1, vm.instruction_pointer
  end
  
  test "should raise StackError if stack[-1] is not a hash" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [[INTEGER_, 1]]
      vm.run [
        LENGTH
      ]
    end
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        LENGTH
      ]
    end
  end
  
end