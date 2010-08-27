require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class PushHashTest < Test::Unit::TestCase

  include KoiVM
  
  test "should push hash onto stack" do
    vm = VM.new
    vm.run [
      PUSH_HASH
    ]
    assert_equal [[HASH_, {}]], vm.data_stack
    assert_equal 1, vm.instruction_pointer
  end
  
end