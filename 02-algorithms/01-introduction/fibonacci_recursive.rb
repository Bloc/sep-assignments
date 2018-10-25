def fib_recursive(n)
   if (n == 0)
     return 0
   elsif (n == 1)
     return 1
   else
     return fib_recursive(n-1) + fib_recursive(n-2)
   end
end

puts fib_recursive(0)
puts fib_recursive(1)
puts fib_recursive(2)
puts fib_recursive(3)
puts fib_recursive(4)
puts fib_recursive(5)
puts fib_recursive(6)
puts fib_recursive(7)
puts fib_recursive(8)
puts fib_recursive(9)
