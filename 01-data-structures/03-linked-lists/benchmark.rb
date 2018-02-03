require 'benchmark'
require 'bigdecimal/math'

Benchmark.bm do|bm|
  bm.report do
    Array.new(10_000)
  end
end
