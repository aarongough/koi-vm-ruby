require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class SimpleBenchmark < Test::Unit::TestCase
  
  require "benchmark"
  require "stringio"
  require 'ruby-prof'
  include Koi
  
  vm = VM.new
  
  def teardown
    File.delete("test.html")
  end
  
  test "simple benchmark" do
    Benchmark.bmbm do |b|
      b.report("Ruby") do
        silence do
          1000.times do
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
          1000.times do
            vm.run [
              PUSH, "test.html",
              PUSH, "w",
              FILE_OPEN,
              SET_GLOBAL, 1,
              PUSH, 11,   
              DECREMENT,
              DUP,
              GET_GLOBAL, 1,
              SWAP,
              TO_STRING,
              FILE_PUT,
              GET_GLOBAL, 1,
              PUSH, ", ",
              FILE_PUT,
              DUP, 
              JUMP_IF, -13,
              GET_GLOBAL, 1,
              PUSH, "Blast off!\n",
              FILE_PUT
            ]
          end
        end
      end
    end
  end
  
  test "simple profile" do
    silence do
      result = RubyProf.profile do
        vm.run [
          PUSH, "test.html",
          PUSH, "w",
          FILE_OPEN,
          SET_GLOBAL, 1,
          PUSH, 11,   
          DECREMENT,
          DUP,
          GET_GLOBAL, 1,
          SWAP,
          TO_STRING,
          FILE_PUT,
          GET_GLOBAL, 1,
          PUSH, ", ",
          FILE_PUT,
          DUP, 
          JUMP_IF, -13,
          GET_GLOBAL, 1,
          PUSH, "Blast off!\n",
          FILE_PUT
        ]
      end
      file = File.new(File.join(File.dirname(__FILE__), "koi_profile.html"), "w+")
      printer = RubyProf::GraphHtmlPrinter.new(result)
      printer.print(file, :min_percent=>0)
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