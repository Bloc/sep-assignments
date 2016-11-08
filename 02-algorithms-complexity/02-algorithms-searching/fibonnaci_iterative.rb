def fib_i(n)
  fib_array = [0,1]
  return fib_array[n] if n <= 1

  (2..n).each do |x|
    value = fib_array[x-2] + fib_array[x-1]
    fib_array << value
  end

  return fib_array.last
end

puts fib_i(0) #0
puts fib_i(1) #1
puts fib_i(2) #1
puts fib_i(3) #2
puts fib_i(4) #3
puts fib_i(5) #5
puts fib_i(6) #8
puts fib_i(7) #13
puts fib_i(8) #21
puts fib_i(9) #34
puts fib_i(100) #354224848179261915075
