require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'test_helper.rb'))

class PairsTest < Test::Unit::TestCase

  include KoiVM
  
  test "should return new hash containing all the pairs from the previous hash with numeric indices" do
    vm = VM.new
    vm.data_stack = [
      [HASH_, {
        [INTEGER_, 1] => [STRING_, "yay"], 
        [INTEGER_, 2] => [STRING_, "yay"], 
        [INTEGER_, 6] => [STRING_, "yay"]
      }]
    ]
    vm.run [
      PAIRS
    ]
    assert_equal [
      [HASH_, {
        [INTEGER_, 0] => [ HASH_, {
          [INTEGER_, 0] => [INTEGER_, 1],
          [INTEGER_, 1] => [STRING_, "yay"]
        }],
        [INTEGER_, 1] => [ HASH_, {
          [INTEGER_, 0] => [INTEGER_, 2],
          [INTEGER_, 1] => [STRING_, "yay"]
        }],
        [INTEGER_, 2] => [ HASH_, {
          [INTEGER_, 0] => [INTEGER_, 6],
          [INTEGER_, 1] => [STRING_, "yay"]
        }]
      }]
    ], vm.data_stack
    assert_equal 1, vm.instruction_pointer
  end
  
  test "should return empty hash" do
    vm = VM.new
    vm.data_stack = [[HASH_, {}]]
    vm.run [
      PAIRS
    ]
    assert_equal [[HASH_, {}]], vm.data_stack
    assert_equal 1, vm.instruction_pointer
  end
  
  test "should raise StackError if stack[-1] is not a hash" do
    assert_raises StackError do
      vm = VM.new
      vm.data_stack = [[INTEGER_, 1]]
      vm.run [
        PAIRS
      ]
    end
  end
  
  test "should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      vm = VM.new
      vm.run [
        PAIRS
      ]
    end
  end
  
end