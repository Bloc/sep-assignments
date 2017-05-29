def fib( n )
  if n == 0
    puts "No values"
  elsif n == 1
    b = 1
    puts b
  else
    if n > 1
      a,b = 0,1
      n.times do
        a,b = b,a+b
        puts b
      end
      puts "\n"
    end
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
