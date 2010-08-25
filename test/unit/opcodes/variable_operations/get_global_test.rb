require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class GetGlobalTest < Test::Unit::TestCase

  include KoiVM
  
  test "should get global variable at index x and push onto stack" do
    vm = VM.new
    vm.globals[1] = [STRING_, "hello world!"]
    vm.run [
      GET_GLOBAL, 1
    ]
    assert_equal [[STRING_, "hello world!"]], vm.data_stack
    assert_equal 2, vm.instruction_pointer
  end

  
end