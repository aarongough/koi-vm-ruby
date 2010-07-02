require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", 'test_helper.rb'))

class PrintTest < Test::Unit::TestCase

  include Koi
  
  test "PRINT should output top stack item to STDOUT" do
    old_stdout = $stdout
    tmp_stdout = StringIO.new
    $stdout = tmp_stdout
    vm = VM.new({
      :fibers => [{
        :stack => ["Test"],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      PRINT
    ]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
    assert_equal "Test", tmp_stdout.string
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