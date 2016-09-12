require 'benchmark'

def fib(n)
   if (n == 0)
     # #1
     return 0
   elsif (n == 1)
     # #2
     return 1
   else
     # #3
     return fib(n-1) + fib(n-2)
   end
 end


 Benchmark.bm(25) do |x|
   x.report("recursive test") do
     fib(20)
   end
end 
