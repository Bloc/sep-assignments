def fib_iterative( n )
  if n == 0
    b = 0
  elsif n == 1
    b = 1
  else
    if n > 1
      a,b = 0,1
      n.times do
        a,b = b,a+b
      end
    end
  end
end
