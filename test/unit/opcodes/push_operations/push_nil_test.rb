require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class PushNilTest < Test::Unit::TestCase

  include Koi
  
  test "should put nil onto stack" do
    vm = VM.new
    vm.run [
      PUSH_NIL
    ]
    assert_equal [[NIL_, nil]], vm.data_stack
    assert_equal 1, vm.instruction_pointer
  end
  
end