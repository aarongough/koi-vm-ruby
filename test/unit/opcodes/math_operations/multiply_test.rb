require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class MultiplyTest < Test::Unit::TestCase

  include KoiVMRuby
  
  test "should multiply top two integers on stack" do
    vm = VM.new
    vm.data_stack = [[INTEGER_, 5], [INTEGER_, 2]]
    vm.run [
      MULTIPLY
    ]
    assert_equal [[INTEGER_, 10]], vm.data_stack
  end
  
  test "should multiply top two floats on stack" do
    vm = VM.new
    vm.data_stack = [[FLOAT_, 5.0], [FLOAT_, 2.0]]
    vm.run [
      MULTIPLY
    ]
    assert_equal [[FLOAT_, 10.0]], vm.data_stack
  end
  
  test "should multiply top two numbers on stack and implicitly convert them to floats" do
    vm = VM.new
    vm.data_stack = [[INTEGER_, 5], [FLOAT_, 2.0]]
    vm.run [
      MULTIPLY
    ]
    assert_equal [[FLOAT_, 10.0]], vm.data_stack
  end
  
  test "should multiply top two numbers on stack and implicitly convert them to floats if receiver is a float" do
    vm = VM.new
    vm.data_stack = [[FLOAT_, 5.0], [INTEGER_, 2]]
    vm.run [
      MULTIPLY
    ]
    assert_equal [[FLOAT_, 10.0]], vm.data_stack
  end
  
  test "should raise StackError if there is only one item on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [1]
      vm.run [
        MULTIPLY
      ]
    end
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        MULTIPLY
      ]
    end
  end
  
end