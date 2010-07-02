require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", 'test_helper.rb'))

class ExpectStackSizeTest < Test::Unit::TestCase

  include Koi
  
  test "expect_stack_size(1) should raise StackError if there are not items on the stack" do
    assert_raises StackError do
      VM.new.expect_stack_size(1)
    end
  end
  
  test "expect_stack_size(2) should raise StackError if there are less than 2 items on the stack" do
    assert_raises StackError do
      VM.new({
        :fibers => [{
          :stack => [1],
          :locals => [],
          :instruction_pointer => 0
        }]
      }).expect_stack_size(2)
    end
  end
  
  test "expect_stack_size(2) should not raise anything if there is more than 1 item on the stack" do
    assert_nothing_raised do
      VM.new({
        :fibers => [{
          :stack => [1,2,3],
          :locals => [],
          :instruction_pointer => 0
        }]
      }).expect_stack_size(2)
    end
  end
  
end