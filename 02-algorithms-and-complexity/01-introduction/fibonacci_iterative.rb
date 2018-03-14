def fib(n)
  fib_arr = [0, 1]

  for i in 2..n do
    fib_arr << fib_arr[i-2] + fib_arr[i-1]
  end

  return fib_arr[n]
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
