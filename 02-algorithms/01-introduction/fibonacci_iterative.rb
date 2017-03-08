def fib(n)
  x = 0
  y = 1

  (0...n).each do 
    temp = x
    x = y
    y = temp + y
  end

  return x
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