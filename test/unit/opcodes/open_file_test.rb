require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", 'test_helper.rb'))

class OpenFileTest < Test::Unit::TestCase

  include Koi
  
  test "OPEN_FILE should should return file descriptor" do
    vm = VM.new({
      :fibers => [{
        :stack => [1, "w"],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      OPEN_FILE
    ]
    assert_equal [1], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
    assert_equal 1, vm.files.size
  end
  
  test "OPEN_FILE should should return file descriptor for new file" do
    vm = VM.new({
      :fibers => [{
        :stack => ["test.txt", "w+"],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    state = vm.run [
      OPEN_FILE
    ]
    assert_equal 1, state[:fibers][0][:stack].size
    assert state[:fibers][0][:stack][0].is_a?(Integer)
    assert_equal 1, state[:fibers][0][:instruction_pointer]
    assert_equal 1, vm.files.size
  end
  
  test "OPEN_FILE should raise StackError if only 1 item is on the stack" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => ["test.txt",],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        OPEN_FILE
      ]
    end
  end
  
  test "OPEN_FILE should raise StackError if file descriptor is not valid" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => [1.00, "w+"],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        OPEN_FILE
      ]
    end
  end
  
  test "OPEN_FILE should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      VM.new.run [
        OPEN_FILE
      ]
    end
  end
  
  
end