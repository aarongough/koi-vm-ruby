require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class TopTest < Test::Unit::TestCase

  include KoiVM
  
  test "should duplicate the topmost n items on the data stack" do
    vm = VM.new
    vm.data_stack = [1,2,2]
    vm.run [
      TOP, 2
    ]
    assert_equal [1,2,2,2,2], vm.data_stack
  end
  
  test "should raise OperandError if operand is not an integer" do
    assert_raises OperandError do
      vm = VM.new
      vm.data_stack = [1,2]
      vm.run [
        TOP, "a"
      ]
    end
  end
  
  test "should raise StackError if there are not enough items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [1]
      vm.run [
        TOP, 2
      ]
    end
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        TOP, 2
      ]
    end
  end
  
end