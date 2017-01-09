def fib(n)
  return nil if n.nil?

  count = 1
  fib_0 = 0
  fib_1 = 1

  if n == 0
    return 0
  elsif n <= 10
    while count < (n-1) do
      temp = fib_0
      fib_0 = fib_1
      fib_1 = temp + fib_1
      count += 1
    end
  return fib_1
  end
end
