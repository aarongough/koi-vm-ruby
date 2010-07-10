require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", "..", 'test_helper.rb'))

class ReturnTest < Test::Unit::TestCase

  include Koi
  
  test "RETURN should return execution to address at stack[-2]" do
    vm = VM.new({
      :fibers => [{
        :stack => [10, "string"],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      RETURN
    ]
    assert_equal ["string"], state[:fibers][0][:stack]
    assert_equal 10, state[:fibers][0][:instruction_pointer]
  end
  
  test "RETURN should raise StackError if only 1 item is on the stack" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => [10],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        RETURN
      ]
    end
  end
  
  test "RETURN should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      VM.new.run [
        RETURN
      ]
    end
  end
  
end