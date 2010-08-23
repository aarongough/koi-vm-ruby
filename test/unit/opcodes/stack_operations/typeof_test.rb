require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class TypeofTest < Test::Unit::TestCase

  include Koi
  
  test "should push string representing type of topmost stack item onto the stack (nil)" do
    vm = VM.new
    vm.data_stack = [[NIL_, nil]]
    vm.run [
      TYPEOF
    ]
    assert_equal [[STRING_, "nil"]], vm.data_stack
  end
  
  test "should push string representing type of topmost stack item onto the stack (bool)" do
    vm = VM.new
    vm.data_stack = [[BOOL_, true]]
    vm.run [
      TYPEOF
    ]
    assert_equal [[STRING_, "bool"]], vm.data_stack
  end
  
  test "should push string representing type of topmost stack item onto the stack (integer)" do
    vm = VM.new
    vm.data_stack = [[INTEGER_, 1]]
    vm.run [
      TYPEOF
    ]
    assert_equal [[STRING_, "integer"]], vm.data_stack
  end
  
  test "should push string representing type of topmost stack item onto the stack (float)" do
    vm = VM.new
    vm.data_stack = [[FLOAT_, 1.0]]
    vm.run [
      TYPEOF
    ]
    assert_equal [[STRING_, "float"]], vm.data_stack
  end
  
  test "should push string representing type of topmost stack item onto the stack (string)" do
    vm = VM.new
    vm.data_stack = [[STRING_, true]]
    vm.run [
      TYPEOF
    ]
    assert_equal [[STRING_, "string"]], vm.data_stack
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        TYPEOF
      ]
    end
  end
  
end