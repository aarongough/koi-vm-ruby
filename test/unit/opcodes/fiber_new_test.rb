require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", 'test_helper.rb'))

class FiberNewTest < Test::Unit::TestCase

  include Koi
  
  test "FIBER_NEW should copy fiber state to new fiber and switch execution to the new fiber" do
    vm = VM.new
    state = vm.run [
      FIBER_NEW
    ]
    assert_equal 2, state[:fibers].length
    assert_equal [], state[:fibers][1][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
    assert_equal 1, state[:fibers][1][:instruction_pointer]
    assert_equal 1, state[:fiber_id]
  end
  
  test "FIBER_NEW should copy fiber state to new fiber and switch execution to the new fiber (2 fibers)" do
    vm = VM.new({
      :fiber_id => 0,
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
      FIBER_NEW
    ]
    assert_equal 3, state[:fibers].length
    assert_equal 1, state[:fibers][0][:instruction_pointer]
    assert_equal 0, state[:fibers][1][:instruction_pointer]
    assert_equal 1, state[:fibers][2][:instruction_pointer]
    assert_equal 2, state[:fiber_id]
  end
  
  test "code after FIBER_NEW should not affect state of old fiber" do
    vm = VM.new
    state = vm.run [
      FIBER_NEW,
      PUSH, 1
    ]
    assert_equal [], state[:fibers][0][:stack]
    assert_equal [1], state[:fibers][1][:stack]
  end
  
end