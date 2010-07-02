require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class VmInitializationTest < Test::Unit::TestCase

  include Koi
  
  test "VM.new without arguments should return default state" do
    vm = VM.new
    assert_equal [{
      :stack => [],
      :instruction_pointer => 0
    }], vm.state
  end
  
  test "VM.new with valid state should not raise error" do
    assert_nothing_raised do
      VM.new([{
        :stack => [],
        :instruction_pointer => 0
      }])
    end
  end
  
  test "VM.new should raise ArgumentError if given empty state" do
    assert_raises ArgumentError do
      VM.new([])
    end
  end
  
  test "VM.new should raise ArgumentError if given empty hash" do
    assert_raises ArgumentError do
      VM.new([{}])
    end
  end
  
  test "VM.new should raise ArgumentError if given hash without :stack" do
    assert_raises ArgumentError do
      VM.new([{
        :instruction_pointer => 0
      }])
    end
  end
  
  test "VM.new should raise ArgumentError if given hash without :instruction_pointer" do
    assert_raises ArgumentError do
      VM.new([{
        :stack => []
      }])
    end
  end
  
  test "VM.new should raise ArgumentError if given stack that is not an Array" do
    assert_raises ArgumentError do
      VM.new([{
        :stack => 1,
        :instruction_pointer => 0
      }])
    end
  end
  
  test "VM.new should raise ArgumentError if given instruction_pointer that is not an integer" do
    assert_raises ArgumentError do
      VM.new([{
        :stack => [],
        :instruction_pointer => "a"
      }])
    end
  end
  
end