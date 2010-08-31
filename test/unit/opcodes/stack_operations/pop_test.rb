require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class PopTest < Test::Unit::TestCase

  include KoiVMRuby
  
  test "should pop a single item off the data stack" do
    (1..10).each do |x|
      vm = VM.new
      vm.data_stack.fill("x", 0..(x - 1))
      assert_equal x, vm.data_stack.length
      vm.run [
        POP
      ]
      assert_equal x - 1, vm.data_stack.length
    end
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        POP
      ]
    end
  end
  
end