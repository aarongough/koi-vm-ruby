require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class PushBoolTest < Test::Unit::TestCase

  include Koi
  
  test "should put true onto stack" do
    vm = VM.new
    vm.run [
      PUSH_BOOL, true
    ]
    assert_equal [[BOOL_, true]], vm.data_stack
    assert_equal 2, vm.instruction_pointer
  end
  
  test "should put false onto stack" do
    vm = VM.new
    vm.run [
      PUSH_BOOL, false
    ]
    assert_equal [[BOOL_, false]], vm.data_stack
    assert_equal 2, vm.instruction_pointer
  end
  
  test "should raise error if operand is not a boolean value" do
    [1,2.0,"string", [1], {:t=>1}].each do |x|
      assert_raises OperandError do
        vm = VM.new
        vm.run [
          PUSH_BOOL, x
        ]
      end
    end
  end
  
end