require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class VmInitializationTest < Test::Unit::TestCase

  include Koi
  
  test "VM.new without arguments should return default state" do
    vm = VM.new
    default_state = {
      :opcodes => [],
      :fiber_id => 0,
      :globals => [],
      :fibers => [{
        :stack => [],
        :locals => [],
        :instruction_pointer => 0
      }]
    }
    assert_equal default_state, vm.state
  end
  
  test "VM.new with valid state should not raise error" do
    assert_nothing_raised do
      VM.new({
        :globals => [],
        :fibers => [{
          :stack => [],
          :instruction_pointer => 0
        }]
      })
    end
  end
  
  test "VM.new should not raise ArgumentError if given empty hash" do
    assert_nothing_raised do
      VM.new({})
    end
  end
  
  test "VM.new should raise ArgumentError if given state that is not a hash" do
    assert_raises TypeError do
      VM.new([])
    end
  end
  
  test "VM.new should raise ArgumentError if given fiber with :stack that is not an array" do
    assert_raises ArgumentError do
      VM.new({
        :fibers => [{
          :stack => 0
        }]
      })
    end
  end
  
  test "VM.new should raise ArgumentError if given fiber with :instruction_pointer that is not an integer" do
    assert_raises ArgumentError do
      VM.new({
        :fibers => [{
          :instruction_pointer => []
        }]
      })
    end
  end
  
  test "VM.new should raise ArgumentError if given :globals that is not an array" do
    assert_raises ArgumentError do
      VM.new({
        :globals => 1
      })
    end
  end
  
  test "VM.new should raise ArgumentError if given :opcodes that is not an array" do
    assert_raises ArgumentError do
      VM.new({
        :opcodes => 1
      })
    end
  end
  
  test "VM.new should raise ArgumentError if given :fiber_id that is not an array" do
    assert_raises ArgumentError do
      VM.new({
        :fiber_id => []
      })
    end
  end
  
end