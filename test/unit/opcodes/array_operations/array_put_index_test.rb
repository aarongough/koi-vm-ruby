require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", "..", 'test_helper.rb'))

class ArrayPutIndexTest < Test::Unit::TestCase

  include Koi
  
  test "ARRAY_PUT_INDEX should put stack[-1] into array at stack[-3] at index stack[-2]" do
    vm = VM.new({
      :fibers => [{
        :stack => [[1,2,3,4], 2, "test"],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      ARRAY_PUT_INDEX
    ]
    assert_equal [[1,2,"test",4]], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
  end
  
  test "ARRAY_PUT_INDEX should raise StackError if stack[-3] is not an array" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => [[1,2]],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        ARRAY_PUT_INDEX
      ]
    end    
  end
  
  test "ARRAY_PUT_INDEX should raise StackError if stack[-2] is not an integer" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => [[1,"2"]],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        ARRAY_PUT_INDEX
      ]
    end    
  end
  
  test "ARRAY_PUT_INDEX should raise StackError if there 2 items on the stack" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => [[1,2,3,4], 1],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        ARRAY_PUT_INDEX
      ]
    end    
  end
  
  test "ARRAY_PUT_INDEX should raise StackError if is only 1 item on the stack" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => [[1,2,3,4]],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        ARRAY_PUT_INDEX
      ]
    end    
  end
  
  test "ARRAY_PUT_INDEX should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      VM.new.run [
        ARRAY_PUT_INDEX
      ]
    end    
  end
  
end