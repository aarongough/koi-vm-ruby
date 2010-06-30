require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class StksizeTest < Test::Unit::TestCase

  include Koi
  
  test "STKSIZE should add item to stack containing current size of stack" do
    vm = VM.new([{
      :stack => [1,2,3,4],
      :instruction_pointer => 0
    }])
    state = vm.run [
      STKSIZE
    ]
    assert_equal [{
      :stack => [1,2,3,4,4],
      :instruction_pointer => 1
    }], state
  end
  
end