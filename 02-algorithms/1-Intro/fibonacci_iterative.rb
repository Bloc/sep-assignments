def fib(n)
  fib_0 = 0
  fib_1 = 1

  for x in 0..n-1 do
    temp = fib_0
    fib_0 = fib_1
    fib_1 = temp + fib_1
  end
  return fib_1
end

for x in 0..10 do
  puts fib(x)
end
