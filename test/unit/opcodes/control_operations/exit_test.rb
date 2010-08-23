require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class ExitTest < Test::Unit::TestCase

  include Koi
  
  test "should exit" do
    vm = VM.new
    vm.run [
      EXIT,
      NO_OP,
      NO_OP,
      NO_OP
    ]
    assert_equal [], vm.data_stack
    assert_equal 1, vm.instruction_pointer
  end

  
end