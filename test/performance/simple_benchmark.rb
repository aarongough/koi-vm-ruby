require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class SimpleBenchmark < Test::Unit::TestCase
  
  require "benchmark"
  require "stringio"
  include Koi
  
  vm = VM.new
  
  test "simple benchmark" do
    Benchmark.bmbm do |b|
      b.report("Ruby") do
        silence do
          100.times do
            x = 10
            while(x > -1) do
              print "#{x}, "
              x -= 1
            end
            print "Blast off!\n"
          end
        end
      end
      
      b.report("Koi") do
        silence do
          100.times do
            vm.run [
              PUSH, 11,
              PUSH, 1,
              SUBTRACT,
              DUP,
              PRINT,
              PUSH, ", ",
              PRINT,
              DUP, 
              JUMP_IF, -9,
              PUSH, "Blast off!\n",
              PRINT
            ]
          end
        end
      end
    end
  end
  
  private
    
    def silence
      old_stdout = $stdout
      $stdout = StringIO.new
      yield
      $stdout = old_stdout
    end
  
end