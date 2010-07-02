require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class SwapTest < Test::Unit::TestCase

  include Koi
  
  test "SWAP should swap top two items on stack" do
    vm = VM.new({
      :fibers => [{
        :stack => [1, 2],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      SWAP
    ]
    assert_equal [2,1], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
  end
  
  test "SWAP should raise StackError if only 1 item is on the stack" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => [1],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
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