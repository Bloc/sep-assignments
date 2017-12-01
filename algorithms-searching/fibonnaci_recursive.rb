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
