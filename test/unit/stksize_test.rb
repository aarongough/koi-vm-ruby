require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class StksizeTest < Test::Unit::TestCase

  include Koi
  
  test "STKSIZE should add item to stack containing current size of stack" do
    vm = VM.new({
      :fibers => [{
        :stack => [1,2,3,4],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      STKSIZE
    ]
    assert_equal [1,2,3,4,4], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
  end
  
end