require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class PrintTest < Test::Unit::TestCase

  include Koi
  
  test "PRINT REGA should output REGA to STDOUT" do
    old_stdout = $stdout
    tmp_stdout = StringIO.new
    $stdout = tmp_stdout
    vm = VM.new([{
      :stack => ["Test"],
      :instruction_pointer => 0
    }])
    vm.run [
      PRINT
    ]
    assert_equal "Test\n", tmp_stdout.string
    $stdout = old_stdout
  end
  
  test "PRINT should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      VM.new.run [
        PRINT
      ]
    end
  end
  
end