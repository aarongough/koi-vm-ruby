require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class PopTest < Test::Unit::TestCase

  include Koi
  
  test "POP should remove topmost item from stack" do
    vm = VM.new({
      :fibers => [{
        :stack => [1, 2],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      POP
    ]
    assert_equal [1], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
  end
  
  test "POP should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      VM.new.run [
        POP
      ]
    end
  end
  
end