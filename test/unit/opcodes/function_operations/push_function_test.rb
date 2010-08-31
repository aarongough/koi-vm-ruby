require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class PushFunctionTest < Test::Unit::TestCase

  include KoiVMRuby
  
  test "should push function reference onto stack" do
    vm = VM.new
    vm.run [
      PUSH_FUNCTION, 1,
      NO_OP,
      NO_OP,
      RETURN,
      END_FUNCTION, 0,
      END_FUNCTION, 1
    ]
    assert_equal [[FUNCTION_, 2]], vm.data_stack
    assert_equal 9, vm.instruction_pointer
  end
  
  test "should push function reference onto stack that contains nested function definition" do
    vm = VM.new
    vm.run [
      PUSH_FUNCTION, 6,
      NO_OP,
        PUSH_FUNCTION, 2,
        NO_OP,
        RETURN,
        END_FUNCTION, 0,
        END_FUNCTION, 2,
      NO_OP,
      RETURN,
      END_FUNCTION, 0,
      END_FUNCTION, 6
    ]
    assert_equal [[FUNCTION_, 2]], vm.data_stack
    assert_equal 17, vm.instruction_pointer
  end
  
    
end