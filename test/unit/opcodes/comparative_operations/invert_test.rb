require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class InvertTest < Test::Unit::TestCase

  include KoiVMRuby
  
  test "should invert boolean value true -> false" do
    vm = VM.new
    vm.data_stack = [[BOOL_, true]]
    vm.run [
      INVERT
    ]
    assert_equal [[BOOL_, false]], vm.data_stack
  end
  
  test "should invert boolean value false -> true" do
    vm = VM.new
    vm.data_stack = [[BOOL_, false]]
    vm.run [
      INVERT
    ]
    assert_equal [[BOOL_, true]], vm.data_stack
  end
  
  test "should raise StackError topmost stack value is not a bool" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [[INTEGER_, 1]]
      vm.run [
        INVERT
      ]
    end
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        INVERT
      ]
    end
  end
  
end