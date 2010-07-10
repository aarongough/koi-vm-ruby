require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", "..", 'test_helper.rb'))

class ArrayNewTest < Test::Unit::TestCase

  include Koi
  
  test "ARRAY_NEW should push empty array onto stack" do
    state = VM.new.run [
      ARRAY_NEW
    ]
    assert_equal [[]], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
  end
  
end