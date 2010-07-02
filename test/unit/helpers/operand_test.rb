require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", 'test_helper.rb'))

class OperandTest < Test::Unit::TestCase

  include Koi
  
  test "operand() should return operand for current opcode" do
    vm = VM.new({},[
      PUSH, "Test"
    ])
    assert_equal "Test", vm.operand(String)
  end
  
  test "operand(Integer) should raise OperandError if operand is not an integer" do
    assert_raises OperandError do
      vm = VM.new({},[
        PUSH, "Test"
      ])
      vm.operand(Integer)
    end
  end
  
  test "operand(Float) should raise OperandError if operand is not a float" do
    assert_raises OperandError do
      vm = VM.new({},[
        PUSH, "Test"
      ])
      vm.operand(Float)
    end
  end
  
  test "operand(String) should raise OperandError if operand is not a string" do
    assert_raises OperandError do
      vm = VM.new({},[
        PUSH, 1
      ])
      vm.operand(String)
    end
  end
  
  test "operand(Integer) should not raise anything if operand is an integer" do
    assert_nothing_raised do
      vm = VM.new({},[
        PUSH, 1
      ])
      assert_equal 1, vm.operand(Integer)
    end
  end
  
  test "operand(Float) should not raise anything if operand is a float" do
    assert_nothing_raised do
      vm = VM.new({},[
        PUSH, 1.0
      ])
      assert_equal 1.0, vm.operand(Float)
    end
  end
  
  test "operand(String) should not raise anything if operand is a string" do
    assert_nothing_raised do
      vm = VM.new({},[
        PUSH, "hi!"
      ])
      assert_equal "hi!", vm.operand(String)
    end
  end
  
end