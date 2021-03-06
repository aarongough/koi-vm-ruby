require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class AddTest < Test::Unit::TestCase

  include KoiVMRuby
  
  test "should add top two integers on stack" do
    vm = VM.new
    vm.data_stack = [[INTEGER_, 9], [INTEGER_, 9]]
    vm.run [
      ADD
    ]
    assert_equal [[INTEGER_, 18]], vm.data_stack
  end
  
  test "should add top two floats on stack" do
    vm = VM.new
    vm.data_stack = [[FLOAT_, 9.0], [FLOAT_, 9.0]]
    vm.run [
      ADD
    ]
    assert_equal [[FLOAT_, 18.0]], vm.data_stack
  end
  
  test "should add top two numbers on stack and implicitly convert them to floats" do
    vm = VM.new
    vm.data_stack = [[INTEGER_, 9], [FLOAT_, 9.0]]
    vm.run [
      ADD
    ]
    assert_equal [[FLOAT_, 18.0]], vm.data_stack
  end
  
  test "should add top two numbers on stack and implicitly convert them to floats if receiver is a float" do
    vm = VM.new
    vm.data_stack = [[FLOAT_, 9.0], [INTEGER_, 9]]
    vm.run [
      ADD
    ]
    assert_equal [[FLOAT_, 18.0]], vm.data_stack
  end
  
  test "should raise StackError if there is only one item on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [1]
      vm.run [
        ADD
      ]
    end
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        ADD
      ]
    end
  end
  
end