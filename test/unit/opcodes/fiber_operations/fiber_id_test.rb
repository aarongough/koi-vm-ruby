require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", "..", 'test_helper.rb'))

class FiberIdTest < Test::Unit::TestCase

  include Koi
  
  test "FIBER_ID should put id of current fiber onto stack (0)" do
    vm = VM.new({
      :fiber_id => 0
    })
    state = vm.run [
      FIBER_ID
    ]
    assert_equal [0], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
  end
  
  test "FIBER_ID should put id of current fiber onto stack (1)" do
    vm = VM.new({
      :fiber_id => 1,
      :fibers => [{
        :stack => [],
        :locals => [],
        :instruction_pointer => 0
        },{
        :stack => [],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      FIBER_ID
    ]
    assert_equal 1, state[:fibers][1][:instruction_pointer]
    assert_equal [1], state[:fibers][1][:stack]
  end
  
end