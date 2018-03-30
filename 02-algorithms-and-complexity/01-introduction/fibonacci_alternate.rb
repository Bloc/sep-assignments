def fib(n)
  fibonacci = Hash.new{ |h,k| h[k] = k < 2 ? k : h[k-1] + h[k-2] }
  return fibonacci[n]
end

puts fib(0)
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)
puts fib(8)
puts fib(9)
