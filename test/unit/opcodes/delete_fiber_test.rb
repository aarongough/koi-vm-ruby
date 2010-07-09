require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", 'test_helper.rb'))

class DeleteFiberTest < Test::Unit::TestCase

  include Koi
  
  test "DELETE_FIBER should delete current fiber if there is more than one fiber and switch execution to next fiber (2 fibers)" do
    vm = VM.new({
      :fiber_id => 1,
      :fibers => [{
        :stack => [],
        :locals => [],
        :instruction_pointer => 1
        },{
        :stack => [],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      DELETE_FIBER
    ]
    assert_equal 1, state[:fibers].compact.length
    assert_equal 0, state[:fiber_id]
  end
  
  test "DELETE_FIBER should delete current fiber if there is more than one fiber and switch execution to next fiber (3 fibers)" do
    vm = VM.new({
      :fiber_id => 1,
      :fibers => [{
        :stack => [],
        :locals => [],
        :instruction_pointer => 1
        },{
        :stack => [],
        :locals => [],
        :instruction_pointer => 0
        },{
        :stack => [],
        :locals => [],
        :instruction_pointer => 1
      }]
    })
    state = vm.run [
      DELETE_FIBER
    ]
    assert_equal 2, state[:fibers].compact.length
    assert_equal 2, state[:fiber_id]
  end
  
  test "DELETE_FIBER should do nothing if there is only 1 fiber" do
    vm = VM.new
    state = vm.run [
      DELETE_FIBER,
      PUSH, 1
    ]
    assert_equal [1], state[:fibers][0][:stack]
    assert_equal 3, state[:fibers][0][:instruction_pointer]
  end
  
end