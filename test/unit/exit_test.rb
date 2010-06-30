require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class ExitTest < Test::Unit::TestCase

  include Koi
  
  test "EXIT should immediately end execution" do
    state = VM.new.run [
      EXIT,
      PUSH, "Hello"
    ]
    assert_equal [{
      :stack => [],
      :instruction_pointer => 1
    }], state
  end
  
end