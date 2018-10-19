def fib(n)
  if n == 0
    return 0
  else
    fib_0 = 0
    fib_1 = 1
    (1..(n-1)).each do
      temp = fib_0
      fib_0 = fib_1
      fib_1 = temp + fib_1
    end
   return fib_1
  end
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
