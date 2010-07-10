require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", "..", 'test_helper.rb'))

class TopTest < Test::Unit::TestCase

  include Koi
  
  test "TOP should duplicate top n stack items" do
    vm = VM.new({
      :fibers => [{
        :stack => [1,2,3,4],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      TOP, 2
    ]
    assert_equal [1,2,3,4,3,4], state[:fibers][0][:stack]
    assert_equal 2, state[:fibers][0][:instruction_pointer]
  end
  
  test "TOP should raise StackError when there are not enough items on the stack" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => [1,2,3,4],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        TOP, 5
      ]
    end
  end
  
  test "TOP should raise StackError when there are no items on the stack" do
    assert_raises StackError do
      VM.new.run [
        TOP, 1
      ]
    end
  end
  
  test "TOP should raise OperandError when operand is not supplied" do
    assert_raises OperandError do
      vm = VM.new({
        :fibers => [{
          :stack => [1,2,3,4],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        TOP
      ]
    end
  end
  
  test "TOP should raise OperandError when operand is not an integer" do
    assert_raises OperandError do
      vm = VM.new({
        :fibers => [{
          :stack => [1,2,3,4],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        TOP, "5"
      ]
    end
  end
  
end