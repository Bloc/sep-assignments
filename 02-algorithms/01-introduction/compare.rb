require 'benchmark'

require_relative './fibonacci_iterative.rb'
require_relative './fibonacci_recursive.rb'

puts '----------fib(20)---------'

Benchmark.bm do |x|
  x.report("Iterative") {fib(20)}
  x.report("Recursive") {fib_recursive(20)}
end
