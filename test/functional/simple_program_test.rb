require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class SimpleProgramTest < Test::Unit::TestCase
  
  include Koi
  
  test "should run simple program" do
    state = VM.new.run [
      PUSH, "Hello",
      PUSH, "world!"
    ]
    assert_equal [{
      :stack => ["Hello", "world!"],
      :instruction_pointer => 4
    }], state
  end
end