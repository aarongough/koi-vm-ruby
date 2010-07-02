require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class AddTest < Test::Unit::TestCase

  include Koi
  
  test "ADD should add top two items on the stack" do
    vm = VM.new({
      :fibers => [{
        :stack => [2, 2],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      ADD
    ]
    assert_equal [4], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
  end
  
  test "ADD should raise StackError if only 1 item is on the stack" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => [2],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        ADD
      ]
    end
  end
  
  test "ADD should raise StackError if no items are on the stack" do
    assert_raises StackError do
      VM.new.run [
        ADD
      ]
    end
  end
  
end