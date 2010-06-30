require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class NoOpTest < Test::Unit::TestCase

  include Koi
  
  test "no_op should do nothing" do
    state = VM.new.run [
      NO_OP
    ]
    assert_equal [{
      :stack => [],
      :instruction_pointer => 1
    }], state
  end
  
end