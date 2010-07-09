require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", 'test_helper.rb'))

class CallTest < Test::Unit::TestCase

  include Koi
  
  test "CALL should skip execution to opcode at stack[-1] and push instruction_pointer + 1 onto stack" do
    vm = VM.new({
      :fibers => [{
        :stack => [4],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      CALL,
      PUSH, 10,
      PUSH_FUNCTION,
      NO_OP,
      END_FUNCTION
    ]
    assert_equal [1], state[:fibers][0][:stack]
    assert_equal 6, state[:fibers][0][:instruction_pointer]
  end
  
  test "CALL should raise RuntimeError if address provided is not preceded by a PUSH_FUNCTION opcode" do
    assert_raises RuntimeError do
      vm = VM.new({
        :fibers => [{
          :stack => [3],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        CALL,
        NO_OP,
        NO_OP,
        NO_OP
      ]
    end
  end
  
  test "CALL should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      VM.new.run [
        CALL
      ]
    end
  end
  
end