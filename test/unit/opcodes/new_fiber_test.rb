require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", 'test_helper.rb'))

class NewFiberTest < Test::Unit::TestCase

  include Koi
  
  test "NEW_FIBER should copy fiber state to new fiber and switch execution to the new fiber" do
    vm = VM.new
    state = vm.run [
      NEW_FIBER
    ]
    assert_equal 2, state[:fibers].length
    assert_equal [], state[:fibers][1][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
    assert_equal 1, state[:fibers][1][:instruction_pointer]
    assert_equal 1, state[:fiber_id]
  end
  
  test "code after NEW_FIBER should not affect state of old fiber" do
    vm = VM.new
    state = vm.run [
      NEW_FIBER,
      PUSH, 1
    ]
    assert_equal [], state[:fibers][0][:stack]
    assert_equal [1], state[:fibers][1][:stack]
  end
  
end