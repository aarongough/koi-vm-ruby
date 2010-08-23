require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class GetsTest < Test::Unit::TestCase

  include Koi
  
  require "stringio"
  
  test "should get string from stdin and push it onto stack as a string" do
    input = "Test"
    old_stdin = $stdin
    buffer = StringIO.new
    $stdin = buffer
    buffer.string = input
    vm = VM.new
    vm.run [
      GETS
    ]
    assert_equal [[STRING_, input]], vm.data_stack
    $stdin = old_stdin
  end
  
  test "should get newline separated strings from stdin and push onto stack as a string" do
    input = "Test\nstring"
    old_stdin = $stdin
    buffer = StringIO.new
    $stdin = buffer
    buffer.string = input
    vm = VM.new
    vm.run [
      GETS,
      GETS
    ]
    assert_equal [[STRING_, "Test\n"], [STRING_, "string"]], vm.data_stack
    $stdin = old_stdin
  end
  
end