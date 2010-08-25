require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class PushStringTest < Test::Unit::TestCase

  include KoiVM
  
  test "should push string onto stack" do
    vm = VM.new
    vm.run [
      PUSH_STRING, "test"
    ]
    assert_equal [[STRING_, "test"]], vm.data_stack
    assert_equal 2, vm.instruction_pointer
  end
  
  test "should raise error if operand is not a string" do
    [false, 2, 2.0, [1], {:t=>1}].each do |x|
      assert_raises OperandError do
        vm = VM.new
        vm.run [
          PUSH_STRING, x
        ]
      end
    end
  end
  
end