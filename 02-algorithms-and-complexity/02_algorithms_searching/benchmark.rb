require 'benchmark'
require_relative 'fibonacci_recursive'
include Benchmark

Benchmark.benchmark(CAPTION, 7, FORMAT, ">avg:") do |x|
	t1 = x.report("fibonacci_recursive(20): ") { 
		fib_r(20)
	}		
	t2 = x.report("fibonacci_iterative(20): ") { 
		fib_i(20)
	}		
end
