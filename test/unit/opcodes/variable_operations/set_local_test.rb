require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class SetLocalTest < Test::Unit::TestCase

  include Koi
  
  test "should set local variable at index x" do
    vm = VM.new
    vm.data_stack = [[STRING_, "test"]]
    vm.run [
      SET_LOCAL, 1
    ]
    assert_equal({1 => [STRING_, "test"]}, vm.locals)
    assert_equal [], vm.data_stack
    assert_equal 2, vm.instruction_pointer
  end
  
  test "should raise StackError if there is nothing on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        SET_LOCAL, 1
      ]
    end
  end
  
end