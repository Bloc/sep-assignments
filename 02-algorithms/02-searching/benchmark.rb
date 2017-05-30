require 'benchmark'
require_relative 'fibonnaci_recursive'
require_relative 'fibonacci_iterative'

array = []

p "Fibonnaci Recursive"
puts Benchmark.measure {
  fib(20)
}

p "Fibonnaci Iterative"
puts Benchmark.measure {
  fib_iterative(20)
}
