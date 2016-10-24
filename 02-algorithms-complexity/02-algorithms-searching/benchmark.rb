require 'benchmark'
require_relative 'fibonnaci_iterative'
require_relative 'fibonnaci_recursive'

Benchmark.bm(10) do |x|
  x.report('iterative:')  {fib_i(20)}
  x.report('recursive:')  {fib_r(20)}
end
