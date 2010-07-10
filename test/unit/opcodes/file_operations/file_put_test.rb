require File.expand_path(File.join(File.dirname(__FILE__), '..', "..", "..", 'test_helper.rb'))

class FilePutTest < Test::Unit::TestCase

  include Koi
  
  def setup
    @test_file = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "..", "test.txt"))
  end
  
  test "FILE_PUT should write stack[-1] to descriptor at stack[-2]" do
    vm = VM.new({
      :fibers => [{
        :stack => [1, "test"],
        :locals => [],
        :instruction_pointer => 0
      }]
    })
    file_desc = IO.sysopen(@test_file, "w+")
    vm.files[1] = IO.new(file_desc)
    state = vm.run [
      FILE_PUT
    ]
    vm.files[1].flush
    assert_equal [], state[:fibers][0][:stack]
    assert_equal 1, state[:fibers][0][:instruction_pointer]
    assert File.exists?(@test_file)
    File.open(@test_file) do |f|
      assert_equal "test", f.read
    end
    File.delete(@test_file)
  end
  
  
  test "FILE_PUT should raise StackError if only 1 item is on the stack" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => ["test.txt",],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        FILE_PUT
      ]
    end
  end
  
  test "FILE_PUT should raise StackError if file descriptor is not valid" do
    assert_raises StackError do
      vm = VM.new({
        :fibers => [{
          :stack => [1.00, "w+"],
          :locals => [],
          :instruction_pointer => 0
        }]
      })
      state = vm.run [
        FILE_PUT
      ]
    end
  end
  
  test "FILE_PUT should raise StackError if there are no items on the stack" do
    assert_raises StackError do
      VM.new.run [
        FILE_PUT
      ]
    end
  end

  
end