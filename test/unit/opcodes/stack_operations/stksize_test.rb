require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class StksizeTest < Test::Unit::TestCase

  include Koi
  
  test "should push an integer onto the stack representing the number of entries on the stack before the call" do
    (1..10).each do |x|
      vm = VM.new
      vm.data_stack.fill("x", 0..(x - 1))
      assert_equal x, vm.data_stack.length
      vm.data_stack.length
      vm.run [
        STKSIZE
      ]
      assert_equal [INTEGER_, vm.data_stack.length - 1], vm.data_stack.last
    end
  end
  
end