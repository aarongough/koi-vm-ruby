require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class JumpTest < Test::Unit::TestCase

  include Koi
  
  test "should set instruction_pointer to 10" do
    vm = VM.new
    vm.run [
      JUMP, 10
    ]
    assert_equal 10, vm.instruction_pointer
  end
  
  test "should set instruction_pointer to 11" do
    vm = VM.new
    vm.instruction_pointer = 1
    vm.run [
      0,
      JUMP, 10
    ]
    assert_equal 11, vm.instruction_pointer
  end
  
  test "should raise error if operand is not an integer" do
    [false, 2.0 ,"string", [1], {:t=>1}].each do |x|
      assert_raises OperandError do
        vm = VM.new
        vm.run [
          JUMP, x
        ]
      end
    end
  end
  
end