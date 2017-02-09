def FIB(n)
	return 0 if n == 0
	return 1 if n == 1
	fib0 = 0
	fib1 = 1
	for n in 1..n-1 do
		temp = fib0
		fib0 = fib1
		fib1 = temp + fib1
	end
	return fib1
end

puts "FIB(0): #{FIB(0)}"
puts "FIB(1): #{FIB(1)}"
puts "FIB(2): #{FIB(2)}"
puts "FIB(3): #{FIB(3)}"
puts "FIB(4): #{FIB(4)}"
puts "FIB(5): #{FIB(5)}"
puts "FIB(6): #{FIB(6)}"
puts "FIB(7): #{FIB(7)}"
puts "FIB(8): #{FIB(8)}"
puts "FIB(9): #{FIB(9)}"
puts "FIB(25): #{FIB(25)}"
puts "FIB(100): #{FIB(100)}"
