def fib(n)
  fib_array = [0,1]
  return fib_array[n] if n <= 1

  (2..n).each do |x|
    value = fib_array[x-2] + fib_array[x-1]
    fib_array << value
  end

  return fib_array.last
end

puts fib(0) #0
puts fib(1) #1
puts fib(2) #1
puts fib(3) #2
puts fib(4) #3
puts fib(5) #5
puts fib(6) #8
puts fib(7) #13
puts fib(8) #21
puts fib(9) #34
