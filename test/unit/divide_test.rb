require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class DivideTest < Test::Unit::TestCase

  include Koi
  
  test "DIVIDE should divide stack[-2] by stack [-1]" do
    vm = VM.new([{
      :stack => [10,2],
      :instruction_pointer => 0
    }])
    state = vm.run [
      DIVIDE
    ]
    assert_equal [{
      :stack => [5],
      :instruction_pointer => 1,
    }], state
  end
  
  test "DIVIDE should divide stack[-2] by stack [-1] (reverse)" do
    vm = VM.new([{
      :stack => [2,10],
      :instruction_pointer => 0
    }])
    state = vm.run [
      DIVIDE
    ]
    assert_equal [{
      :stack => [0],
      :instruction_pointer => 1,
    }], state
  end
  
  test "DIVIDE should raise StackError if only 1 item is on the stack" do
    assert_raises StackError do
      vm = VM.new([{
        :stack => [10],
        :instruction_pointer => 0
      }])
      vm.run [
        DIVIDE
      ]
    end
  end
  
  test "DIVIDE should raise StackError if no items are on the stack" do
    assert_raises StackError do
      vm = VM.new([{
        :stack => [],
        :instruction_pointer => 0
      }])
      vm.run [
        DIVIDE
      ]
    end
  end
  
end