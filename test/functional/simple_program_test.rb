require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class SimpleProgramTest < Test::Unit::TestCase
  
  include Koi
  
  test "should run simple program" do
    state = VM.new.run [
      PUSH, "Hello",
      PUSH, "world!"
    ]
    assert_equal ["Hello", "world!"], state[:fibers][0][:stack]
    assert_equal 4, state[:fibers][0][:instruction_pointer]
  end
end