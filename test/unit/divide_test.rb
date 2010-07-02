require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class DivideTest < Test::Unit::TestCase

  include Koi
  
  test "DIVIDE should divide stack[-2] by stack [-1]" do
    vm = VM.new({
      :fibers => [{
        :stack => [10, 2],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      DIVIDE
    ]
    assert_equal [5], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
  end
  
  test "DIVIDE should divide stack[-2] by stack [-1] (reverse)" do
    vm = VM.new({
      :fibers => [{
        :stack => [2, 10],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      DIVIDE
    ]
    assert_equal [0], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
  end
  
  test "DIVIDE should raise StackError if only 1 item is on the stack" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => [10],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        DIVIDE
      ]
    end
  end
  
  test "DIVIDE should raise StackError if no items are on the stack" do
    assert_raises StackError do
      VM.new.run [
        DIVIDE
      ]
    end
  end
  
end