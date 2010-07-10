require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", "..", 'test_helper.rb'))

class ExitTest < Test::Unit::TestCase

  include Koi
  
  test "EXIT should immediately end execution" do
    state = VM.new.run [
      EXIT,
      PUSH, "Hello"
    ]
    assert_equal [], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
  end
  
end