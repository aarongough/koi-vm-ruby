require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class DupTest < Test::Unit::TestCase

  include Koi
  
  test "should duplicate the topmost item on the data stack" do
    vm = VM.new
    vm.data_stack = [2]
    vm.run [
      DUP
    ]
    assert_equal [2,2], vm.data_stack
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        DUP
      ]
    end
  end
  
end