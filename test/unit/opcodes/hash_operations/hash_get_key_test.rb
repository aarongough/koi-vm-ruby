require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", "..", 'test_helper.rb'))

class HashGetKeyTest < Test::Unit::TestCase

  include Koi
  
  test "HASH_GET_KEY should push hash[key] onto stack" do
    vm = VM.new({
      :fibers => [{
        :stack => [{"foo" => "bar"}, "foo"],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      HASH_GET_KEY
    ]
    assert_equal [{"foo" => "bar"}, "bar"], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
  end
  
  test "HASH_GET_KEY should raise StackError if stack[-2] is not a hash" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => [1,2],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        HASH_GET_KEY
      ]
    end    
  end
  
  test "HASH_GET_KEY should raise StackError if there is only one item on the stack" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => [{"foo" => "bar"}],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        HASH_GET_KEY
      ]
    end    
  end
  
  test "HASH_GET_KEY should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      VM.new.run [
        HASH_GET_KEY
      ]
    end    
  end
  
end