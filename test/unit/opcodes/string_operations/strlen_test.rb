require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class StrlenTest < Test::Unit::TestCase

  include KoiVMRuby
  
  test "should push length of topmost string onto stack 1" do
    vm = VM.new
    vm.data_stack = [[STRING_, "hi"]]
    vm.run [
      STRLEN
    ]
    assert_equal [[INTEGER_, 2]], vm.data_stack
  end
  
  test "should push length of topmost string onto stack 2" do
    vm = VM.new
    vm.data_stack = [[STRING_, "hihi"]]
    vm.run [
      STRLEN
    ]
    assert_equal [[INTEGER_, 4]], vm.data_stack
  end
  
  test "should raise StackError if topmost item is not a string" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [[STRING_, "hi"], [INTEGER_, 1]]
      vm.run [
        STRLEN
      ]
    end
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        STRLEN
      ]
    end
  end
  
end