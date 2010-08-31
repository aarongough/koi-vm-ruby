require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class ReturnTest < Test::Unit::TestCase

  include KoiVMRuby
  
  test "should pass execution to topmost address on return stack and decrement scope" do
    vm = VM.new
    vm.return_stack = [101]
    assert_equal [101], vm.return_stack
    vm.level = 1
    vm.run [
      RETURN
    ]
    assert_equal [], vm.data_stack
    assert_equal [], vm.return_stack
    assert_equal 101, vm.instruction_pointer
    assert_equal 0, vm.level
  end
  
  test "should raise ReturnStackError if there are no items on the return stack" do
    assert_raises ReturnStackError do
      vm = VM.new
      vm.run [
        RETURN
      ]
    end
  end

  
end