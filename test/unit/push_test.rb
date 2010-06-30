require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class PushTest < Test::Unit::TestCase

  include Koi
  
  test "PUSH should add item to stack" do
    state = VM.new.run [
      PUSH, "Hello"
    ]
    assert_equal [{
      :stack => ["Hello"],
      :instruction_pointer => 2
    }], state
  end
  
  test "PUSH without operand should raise RuntimeError" do
    assert_raises RuntimeError do
      VM.new.run [
        PUSH
      ]
    end
  end
  
end