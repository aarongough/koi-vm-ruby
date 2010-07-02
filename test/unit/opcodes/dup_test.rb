require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", 'test_helper.rb'))

class PushTest < Test::Unit::TestCase

  include Koi
  
  test "DUP should duplicate top stack item" do
    vm = VM.new({
      :fibers => [{
        :stack => ["test"],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      DUP
    ]
    assert_equal ["test","test"], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
  end
  
  test "DUP should raise StackError when there are no items on the stack" do
    assert_raises StackError do
      VM.new.run [
        DUP
      ]
    end
  end
  
end