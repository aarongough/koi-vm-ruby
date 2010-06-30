require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class PopTest < Test::Unit::TestCase

  include Koi
  
  test "POP should remove topmost item from stack" do
    vm = VM.new([{
      :stack => [1,2],
      :instruction_pointer => 0
    }])
    state = vm.run [
      POP
    ]
    assert_equal [{
      :stack => [1],
      :instruction_pointer => 1
    }], state
  end
  
  test "POP should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      VM.new.run [
        POP
      ]
    end
  end
  
end