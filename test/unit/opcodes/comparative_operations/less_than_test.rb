require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class LessThanTest < Test::Unit::TestCase

  include KoiVMRuby
  
  test "should push bool value onto stack representing whether stack[-2] < stack[-1] (2 2)" do
    vm = VM.new
    vm.data_stack = [[INTEGER_, 2],[INTEGER_, 2]]
    vm.run [
      LESS_THAN
    ]
    assert_equal [[BOOL_, false]], vm.data_stack
  end
  
  test "should push bool value onto stack representing whether stack[-2] < stack[-1] (1 2)" do
    vm = VM.new
    vm.data_stack = [[INTEGER_, 1],[INTEGER_, 2]]
    vm.run [
      LESS_THAN
    ]
    assert_equal [[BOOL_, true]], vm.data_stack
  end
  
  test "should push bool value onto stack representing whether stack[-2] < stack[-1] (3 2)" do
    vm = VM.new
    vm.data_stack = [[INTEGER_, 3],[INTEGER_, 2]]
    vm.run [
      LESS_THAN
    ]
    assert_equal [[BOOL_, false]], vm.data_stack
  end
  
  test "should raise StackError if there are less than 2 items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [1]
      vm.run [
        LESS_THAN
      ]
    end
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        LESS_THAN
      ]
    end
  end
  
end