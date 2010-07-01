require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class InputTest < Test::Unit::TestCase

  include Koi
  
  test "INPUT should get input from STDIN and place on stack" do
    $stdin.reopen(File.expand_path(File.join(File.dirname(__FILE__), "..","fixtures", "stdin")))
    state = VM.new.run [
      INPUT
    ]
    assert_equal [{
      :stack => ["Test"],
      :instruction_pointer => 1
    }], state
  end
  
  test "INPUT should not add anything to stack if there is nothing available at STDIN" do
    $stdin.reopen(File.expand_path(File.join(File.dirname(__FILE__), "..","fixtures", "stdin")))
    state = VM.new.run [
      INPUT
    ]
    assert_equal [{
      :stack => [],
      :instruction_pointer => 1
    }], state
  end
  
end