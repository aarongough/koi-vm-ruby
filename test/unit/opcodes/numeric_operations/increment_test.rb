require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", "..", 'test_helper.rb'))

class IncrementTest < Test::Unit::TestCase

  include Koi
  
  test "INCREMENT should INCREMENT top item on the stack" do
    vm = VM.new({
      :fibers => [{
        :stack => [2],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      INCREMENT
    ]
    assert_equal [3], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
  end
  
  test "INCREMENT should raise StackError if no items are on the stack" do
    assert_raises StackError do
      VM.new.run [
        INCREMENT
      ]
    end
  end
  
end