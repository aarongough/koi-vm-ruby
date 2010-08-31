require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class PushFloatTest < Test::Unit::TestCase

  include KoiVMRuby
  
  test "should push float onto stack" do
    vm = VM.new
    vm.run [
      PUSH_FLOAT, 99.9
    ]
    assert_equal [[FLOAT_, 99.9]], vm.data_stack
    assert_equal 2, vm.instruction_pointer
  end
  
  test "should raise error if operand is not a float" do
    [false, 2, "string", [1], {:t=>1}].each do |x|
      assert_raises OperandError do
        vm = VM.new
        vm.run [
          PUSH_FLOAT, x
        ]
      end
    end
  end
  
end