require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", "..", 'test_helper.rb'))

class ToStringTest < Test::Unit::TestCase

  include Koi
  
  test "PRINT should output top stack item to STDOUT" do
    vm = VM.new({
      :fibers => [{
        :stack => [1],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      TO_STRING
    ]
    assert_equal ["1"], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
  end
  
  test "PRINT should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      VM.new.run [
        TO_STRING
      ]
    end
  end
  
end