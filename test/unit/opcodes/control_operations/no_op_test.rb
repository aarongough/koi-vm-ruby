require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class NoOpTest < Test::Unit::TestCase

  include KoiVM
  
  test "should perform no-op" do
    vm = VM.new
    vm.run [
      NO_OP
    ]
    assert_equal [], vm.data_stack
    assert_equal 1, vm.instruction_pointer
  end

  
end