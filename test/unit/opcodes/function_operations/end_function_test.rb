require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", "..", 'test_helper.rb'))

class EndFunctionTest < Test::Unit::TestCase

  include Koi
  
  test "END_FUNCTION should do nothing" do
    state = VM.new.run [
      END_FUNCTION
    ]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
  end
  
end