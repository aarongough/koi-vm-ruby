require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", 'test_helper.rb'))

class ThisFiberTest < Test::Unit::TestCase

  include Koi
  
  test "this_fiber should return current fiber" do
    vm = VM.new
    assert_same vm.state[:fibers][0], vm.this_fiber 
  end
  
  test "setting via this_fiber should affect machine state" do
    vm = VM.new
    vm.this_fiber[:instruction_pointer] = 10
    assert_equal 10, vm.state[:fibers][0][:instruction_pointer]
  end
  
end