require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", 'test_helper.rb'))

class GetGlobalTest < Test::Unit::TestCase

  include Koi
  
  test "GET_GLOBAL should set local variable at index to first stack item" do
    vm = VM.new({
      :globals => [2]
    })
    state = vm.run [
      GET_GLOBAL, 0
    ]
    assert_equal [2], state[:fibers][0][:stack]
    assert_equal 2, state[:fibers][0][:instruction_pointer]
  end
  
  test "GET_GLOBAL should raise OperandError if index is not supplied" do
    assert_raises OperandError do
      vm = VM.new({
        :globals => [2]
      })
      state = vm.run [
        GET_GLOBAL
      ]
    end
  end
  
  test "GET_GLOBAL should raise OperandError if index is not an integer" do
    assert_raises OperandError do
      vm = VM.new({
        :globals => [2]
      })
      state = vm.run [
        GET_GLOBAL, "5"
      ]
    end
  end
  
  test "GET_GLOBAL should raise RuntimeError if :globals[:index] is not set" do
    assert_raises RuntimeError do
      VM.new.run [
        GET_GLOBAL, 0
      ]
    end
  end
  
end