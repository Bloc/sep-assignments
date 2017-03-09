require 'benchmark'

require_relative 'binary_search_iterative'
require_relative 'binary_search_recursive'

collection = (1..1000000).to_a
value = 123456

Benchmark.bm(20) do |x| 
  x.report("iterative") {
    iterative_binary_search(collection, value)
  }

  x.report("recursive") {
    recursive_binary_search(collection, value)
  }
end