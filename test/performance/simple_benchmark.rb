require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class SimpleBenchmark < Test::Unit::TestCase
  
  require "benchmark"
  require "stringio"
  require 'ruby-prof'
  include KoiVMRuby
  
  vm = VM.new
  
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
              PUSH_INT, 11,
              PUSH_INT, 1,
              SUBTRACT,
              DUP,
              TO_STRING,
              PRINT,
              PUSH_STRING, ", ",
              PRINT,
              DUP,
              PUSH_INT, 0,
              EQUAL,
              JUMP_UNLESS, -13,
              PUSH_STRING, "Blast Off!\n",
              PRINT
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
          PUSH_INT, 11,
          PUSH_INT, 1,
          SUBTRACT,
          DUP,
          TO_STRING,
          PRINT,
          PUSH_STRING, ", ",
          PRINT,
          DUP,
          PUSH_INT, 0,
          EQUAL,
          JUMP_UNLESS, -13,
          PUSH_STRING, "Blast Off!\n",
          PRINT
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