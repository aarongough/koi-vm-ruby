require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class ConcatTest < Test::Unit::TestCase

  include KoiVM
  
  test "should add top two strings on stack" do
    vm = VM.new
    vm.data_stack = [[STRING_, "hi"], [STRING_, "hi"]]
    vm.run [
      CONCAT
    ]
    assert_equal [[STRING_, "hihi"]], vm.data_stack
  end
  
  test "should raise StackError if either of the top two stack items are not strings 1" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [[STRING_, "hi"], [INTEGER_, 1]]
      vm.run [
        CONCAT
      ]
    end
  end
  
  test "should raise StackError if either of the top two stack items are not strings 2" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [[INTEGER_, 1], [STRING_, "hi"]]
      vm.run [
        CONCAT
      ]
    end
  end
  
  test "should raise StackError if either of the top two stack items are not strings 3" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [[INTEGER_, 1], [INTEGER_, 1]]
      vm.run [
        CONCAT
      ]
    end
  end
  
  test "should raise StackError if there is only one item on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [1]
      vm.run [
        CONCAT
      ]
    end
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        CONCAT
      ]
    end
  end
  
end