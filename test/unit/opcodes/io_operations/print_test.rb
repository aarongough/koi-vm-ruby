require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class PrintTest < Test::Unit::TestCase

  include Koi
  
  require "stringio"
  
  test "should print topmost string value from stack" do
    old_stdout = $stdout
    buffer = StringIO.new
    $stdout = buffer
    vm = VM.new
    vm.data_stack = [[STRING_, "test"]]
    vm.run [
      PRINT
    ]
    assert_equal [], vm.data_stack
    assert_equal "test", buffer.string
    $stdout = old_stdout
  end
  
  test "should raise StackError if topmost item is not a string" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [[INTEGER_, 1]]
      vm.run [
        PRINT
      ]
    end
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        PRINT
      ]
    end
  end
  
end