require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class PushIntTest < Test::Unit::TestCase

  include KoiVMRuby
  
  test "should put integer onto stack" do
    vm = VM.new
    vm.run [
      PUSH_INT, 99
    ]
    assert_equal [[INTEGER_, 99]], vm.data_stack
    assert_equal 2, vm.instruction_pointer
  end
  
  test "should raise error if operand is not an integer" do
    [false, 2.0, "string", [1], {:t=>1}].each do |x|
      assert_raises OperandError do
        vm = VM.new
        vm.run [
          PUSH_INT, x
        ]
      end
    end
  end
  
end