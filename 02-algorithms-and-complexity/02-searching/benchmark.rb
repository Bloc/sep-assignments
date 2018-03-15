require 'benchmark'
require_relative 'fibonacci_iterative'
require_relative 'fibonacci_recursive'

#Compare the time it takes to find fib(20)

puts "\nFind fib(20)"
Benchmark.bm(7) do |x|
  x.report("iterative: ") { fib_iterative(20) }
  x.report("recursive: ") { fib_recursive(20) }
end
puts "\n"
