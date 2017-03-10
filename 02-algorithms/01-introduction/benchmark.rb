require 'benchmark'

require_relative 'fibonacci_iterative'
require_relative 'fibonacci_recursive'

Benchmark.bm(20) do |x|
  x.report("iterative") {
    fib_iterative(20)
  }

  x.report("recursive") {
    fib_recursive(20)
  }
end