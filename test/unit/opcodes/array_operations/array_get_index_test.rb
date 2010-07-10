require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", "..", 'test_helper.rb'))

class ArrayGetIndexTest < Test::Unit::TestCase

  include Koi
  
  test "ARRAY_GET_INDEX should push array[index] onto stack" do
    vm = VM.new({
      :fibers => [{
        :stack => [[1,2,3,4], 2],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      ARRAY_GET_INDEX
    ]
    assert_equal [[1,2,3,4], 3], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
  end
  
  test "ARRAY_GET_INDEX should push array[index] onto stack(1)" do
    vm = VM.new({
      :fibers => [{
        :stack => [[1,2,3,4], 1],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      ARRAY_GET_INDEX
    ]
    assert_equal [[1,2,3,4], 2], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
  end
  
  test "ARRAY_GET_INDEX should raise StackError if stack[-2] is not an array" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => [[1,2]],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        ARRAY_GET_INDEX
      ]
    end    
  end
  
  test "ARRAY_GET_INDEX should raise StackError if stack[-1] is not an integer" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => [[1,"2"]],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        ARRAY_GET_INDEX
      ]
    end    
  end
  
  test "ARRAY_GET_INDEX should raise StackError if there is only one item on the stack" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => [[1,2,3,4]],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        ARRAY_GET_INDEX
      ]
    end    
  end
  
  test "ARRAY_GET_INDEX should raise StackError if there are not items on the stack" do
    assert_raises StackError do
      VM.new.run [
        ARRAY_GET_INDEX
      ]
    end    
  end
  
end