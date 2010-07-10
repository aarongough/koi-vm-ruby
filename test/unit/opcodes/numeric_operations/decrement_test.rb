require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", "..", 'test_helper.rb'))

class DecrementTest < Test::Unit::TestCase

  include Koi
  
  test "DECREMENT should DECREMENT top item on the stack" do
    vm = VM.new({
      :fibers => [{
        :stack => [2],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      DECREMENT
    ]
    assert_equal [1], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
  end
  
  test "DECREMENT should raise StackError if no items are on the stack" do
    assert_raises StackError do
      VM.new.run [
        DECREMENT
      ]
    end
  end
  
end