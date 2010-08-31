require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class DivideTest < Test::Unit::TestCase

  include KoiVMRuby
  
  test "should divide top two integers on stack" do
    vm = VM.new
    vm.data_stack = [[INTEGER_, 10], [INTEGER_, 3]]
    vm.run [
      DIVIDE
    ]
    assert_equal [[INTEGER_, 3]], vm.data_stack
  end
  
  test "should divide top two floats on stack" do
    vm = VM.new
    vm.data_stack = [[FLOAT_, 10.0], [FLOAT_, 3.0]]
    vm.run [
      DIVIDE
    ]
    assert_equal [[FLOAT_, 10.0 / 3.0]], vm.data_stack
  end
  
  test "should divide top two numbers on stack and implicitly convert them to floats" do
    vm = VM.new
    vm.data_stack = [[INTEGER_, 10], [FLOAT_, 3.0]]
    vm.run [
      DIVIDE
    ]
    assert_equal [[FLOAT_, 10.0 / 3.0]], vm.data_stack
  end
  
  test "should divide top two numbers on stack and implicitly convert them to floats if receiver is a float" do
    vm = VM.new
    vm.data_stack = [[FLOAT_, 10.0], [INTEGER_, 3]]
    vm.run [
      DIVIDE
    ]
    assert_equal [[FLOAT_, 10.0 / 3.0]], vm.data_stack
  end
  
  test "should raise StackError if there is only one item on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [1]
      vm.run [
        DIVIDE
      ]
    end
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        DIVIDE
      ]
    end
  end
  
end