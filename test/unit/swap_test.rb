require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class SwapTest < Test::Unit::TestCase

  include Koi
  
  test "SWAP should swap top two items on stack" do
    vm = VM.new([{
      :stack => [1,2],
      :instruction_pointer => 0
    }])
    state = vm.run [
      SWAP
    ]
    assert_equal [{
      :stack => [2,1],
      :instruction_pointer => 1
    }], state
  end
  
  test "SWAP should raise StackError if only 1 item is on the stack" do
    assert_raises StackError do
      vm = VM.new([{
        :stack => [1],
        :instruction_pointer => 0
      }])
      state = vm.run [
        SWAP
      ]
    end
  end
  
  test "SWAP should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      VM.new.run [
        SWAP
      ]
    end
  end
  
end