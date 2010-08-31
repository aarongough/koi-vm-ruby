require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class ToStringTest < Test::Unit::TestCase

  include KoiVMRuby
  
  test "should push string representing topmost stack item onto the stack (nil)" do
    vm = VM.new
    vm.data_stack = [[NIL_, nil]]
    vm.run [
      TO_STRING
    ]
    assert_equal [[STRING_, "nil"]], vm.data_stack
  end
  
  test "should push string representing topmost stack item onto the stack (bool true)" do
    vm = VM.new
    vm.data_stack = [[BOOL_, true]]
    vm.run [
      TO_STRING
    ]
    assert_equal [[STRING_, "true"]], vm.data_stack
  end
  
  test "should push string representing topmost stack item onto the stack (bool false)" do
    vm = VM.new
    vm.data_stack = [[BOOL_, false]]
    vm.run [
      TO_STRING
    ]
    assert_equal [[STRING_, "false"]], vm.data_stack
  end
  
  test "should push string representing topmost stack item onto the stack (integer)" do
    vm = VM.new
    vm.data_stack = [[INTEGER_, 1]]
    vm.run [
      TO_STRING
    ]
    assert_equal [[STRING_, "1"]], vm.data_stack
  end
  
  test "should push string representing topmost stack item onto the stack (float)" do
    vm = VM.new
    vm.data_stack = [[FLOAT_, 1.0]]
    vm.run [
      TO_STRING
    ]
    assert_equal [[STRING_, "1.0"]], vm.data_stack
  end
  
  test "should push string representing topmost stack item onto the stack (string)" do
    vm = VM.new
    vm.data_stack = [[STRING_, "string"]]
    vm.run [
      TO_STRING
    ]
    assert_equal [[STRING_, "string"]], vm.data_stack
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        TO_STRING
      ]
    end
  end
  
end