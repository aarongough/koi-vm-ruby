require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class PushFunctionTest < Test::Unit::TestCase

  include KoiVM
  
  test "should push function reference onto stack" do
    vm = VM.new
    vm.run [
      PUSH_FUNCTION, 1,
      NO_OP,
      NO_OP,
      END_FUNCTION, 0,
      END_FUNCTION, 1
    ]
    assert_equal [[FUNCTION_, 2]], vm.data_stack
    assert_equal 8, vm.instruction_pointer
  end

  
end