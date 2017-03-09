def fib_iterative(n)
  x = 0
  y = 1

  (0...n).each do 
    temp = x
    x = y
    y = temp + y
  end

  return x
end


puts fib_iterative(0)
puts fib_iterative(1)
puts fib_iterative(2)
puts fib_iterative(3)
puts fib_iterative(4)
puts fib_iterative(5)
puts fib_iterative(6)
puts fib_iterative(7)
puts fib_iterative(8)
puts fib_iterative(9)