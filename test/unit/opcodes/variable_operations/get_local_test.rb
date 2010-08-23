require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class GetLocalTest < Test::Unit::TestCase

  include Koi
  
  test "should get local variable at index x and push onto stack" do
    vm = VM.new
    vm.locals[1] = [STRING_, "hello world!"]
    vm.run [
      GET_LOCAL, 1
    ]
    assert_equal [[STRING_, "hello world!"]], vm.data_stack
    assert_equal 2, vm.instruction_pointer
  end

  
end