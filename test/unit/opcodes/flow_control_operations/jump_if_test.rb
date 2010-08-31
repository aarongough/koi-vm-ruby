require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class JumpIfTest < Test::Unit::TestCase

  include KoiVMRuby
  
  test "should set instruction_pointer to 10 when data_stack[0] != (false || nil)" do
    [[INTEGER_, 0], [STRING_, ""], [BOOL_, true]].each do |x|
      vm = VM.new
      vm.data_stack = [x]
      vm.run [
        JUMP_IF, 10
      ]
      assert_equal 10, vm.instruction_pointer
    end
  end
  
  test "should not set instruction_pointer to 10 when data_stack[0] == (false || nil)" do
    [[NIL_, nil], [BOOL_, false]].each do |x|
      vm = VM.new
      vm.data_stack = [x]
      vm.run [
        JUMP_IF, 10
      ]
      assert_equal 2, vm.instruction_pointer
    end
  end
  
  test "should raise error if there is not at least 1 item on the data stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        JUMP_IF, 20
      ]
    end
  end
  
  test "should raise error if operand is not an integer" do
    [false, 2.0 ,"string", [1], {:t=>1}].each do |x|
      assert_raises OperandError do
        vm = VM.new
        vm.data_stack = [[BOOL_, true]]
        vm.run [
          JUMP_IF, x
        ]
      end
    end
  end
  
end