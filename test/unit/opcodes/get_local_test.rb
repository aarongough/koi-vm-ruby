require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", 'test_helper.rb'))

class GetLocalTest < Test::Unit::TestCase

  include Koi
  
  test "GET_LOCAL should set local variable at index to first stack item" do
    vm = VM.new({
      :fibers => [{
        :stack => [],
        :locals => [2],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      GET_LOCAL, 0
    ]
    assert_equal [2], state[:fibers][0][:stack]
    assert_equal 2, state[:fibers][0][:instruction_pointer]
  end
  
  test "GET_LOCAL should raise OperandError if index is not supplied" do
    assert_raises OperandError do
      vm = VM.new({
        :fibers => [{
          :stack => [2],
          :locals => [2],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        GET_LOCAL
      ]
    end
  end
  
  test "GET_LOCAL should raise OperandError if index is not an integer" do
    assert_raises OperandError do
      vm = VM.new({
        :fibers => [{
          :stack => [2],
          :locals => [2],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        GET_LOCAL, "5"
      ]
    end
  end
  
  test "GET_LOCAL should raise RuntimeError if :locals[:index] is not set" do
    assert_raises RuntimeError do
      VM.new.run [
        GET_LOCAL, 0
      ]
    end
  end
  
end