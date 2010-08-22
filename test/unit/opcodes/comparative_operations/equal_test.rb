require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class EqualTest < Test::Unit::TestCase

  include Koi
  
  test "should push bool value onto stack representing equality of topmost 2 stack items (true int)" do
    vm = VM.new
    vm.data_stack = [[INTEGER_, 2],[INTEGER_, 2]]
    vm.run [
      EQUAL
    ]
    assert_equal [[BOOL_, true]], vm.data_stack
  end
  
  test "should push bool value onto stack representing equality of topmost 2 stack items (false int)" do
    vm = VM.new
    vm.data_stack = [[INTEGER_, 2],[INTEGER_, 1]]
    vm.run [
      EQUAL
    ]
    assert_equal [[BOOL_, false]], vm.data_stack
  end
  
  test "should push bool value onto stack representing equality of topmost 2 stack items (true nil)" do
    vm = VM.new
    vm.data_stack = [[NIL_, nil],[NIL_, nil]]
    vm.run [
      EQUAL
    ]
    assert_equal [[BOOL_, true]], vm.data_stack
  end
  
  test "should push bool value onto stack representing equality of topmost 2 stack items (false nil)" do
    vm = VM.new
    vm.data_stack = [[NIL_, 2],[INTEGER_, 1]]
    vm.run [
      EQUAL
    ]
    assert_equal [[BOOL_, false]], vm.data_stack
  end
  
  test "should push bool value onto stack representing equality of topmost 2 stack items (true float)" do
    vm = VM.new
    vm.data_stack = [[FLOAT_, 2.0],[FLOAT_, 2.0]]
    vm.run [
      EQUAL
    ]
    assert_equal [[BOOL_, true]], vm.data_stack
  end
  
  test "should push bool value onto stack representing equality of topmost 2 stack items (false float)" do
    vm = VM.new
    vm.data_stack = [[FLOAT_, 2.0],[FLOAT_, 1.0]]
    vm.run [
      EQUAL
    ]
    assert_equal [[BOOL_, false]], vm.data_stack
  end
  
  test "should push bool value onto stack representing equality of topmost 2 stack items (true bool)" do
    vm = VM.new
    vm.data_stack = [[BOOL_, true],[BOOL_, true]]
    vm.run [
      EQUAL
    ]
    assert_equal [[BOOL_, true]], vm.data_stack
  end
  
  test "should push bool value onto stack representing equality of topmost 2 stack items (false bool)" do
    vm = VM.new
    vm.data_stack = [[BOOL_, true],[BOOL_, false]]
    vm.run [
      EQUAL
    ]
    assert_equal [[BOOL_, false]], vm.data_stack
  end
  
  test "should push bool value onto stack representing equality of topmost 2 stack items (true string)" do
    vm = VM.new
    vm.data_stack = [[STRING_, "hi"],[STRING_, "hi"]]
    vm.run [
      EQUAL
    ]
    assert_equal [[BOOL_, true]], vm.data_stack
  end
  
  test "should push bool value onto stack representing equality of topmost 2 stack items (false string)" do
    vm = VM.new
    vm.data_stack = [[STRING_, "hi"],[STRING_, ""]]
    vm.run [
      EQUAL
    ]
    assert_equal [[BOOL_, false]], vm.data_stack
  end
  
  test "should raise StackError if there are less than 2 items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [1]
      vm.run [
        EQUAL
      ]
    end
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        EQUAL
      ]
    end
  end
  
end