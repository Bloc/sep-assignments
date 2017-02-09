def fib_r(n)
	if n == 0
		return 0
	elsif n == 1
		return 1
	else
		return fib_r(n-1) + fib_r(n-2)
	end
end

def fib_i(n)
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

puts "fib_r(0): #{fib_r(0)}"
puts "fib_r(1): #{fib_r(1)}"
puts "fib_r(2): #{fib_r(2)}"
puts "fib_r(3): #{fib_r(3)}"
puts "fib_r(4): #{fib_r(4)}"
puts "fib_r(5): #{fib_r(5)}"
puts "fib_r(6): #{fib_r(6)}"
puts "fib_r(7): #{fib_r(7)}"
puts "fib_r(8): #{fib_r(8)}"
puts "fib_r(9): #{fib_r(9)}"

# puts "fib_i(0): #{fib_i(0)}"
# puts "fib_i(1): #{fib_i(1)}"
# puts "fib_i(2): #{fib_i(2)}"
# puts "fib_i(3): #{fib_i(3)}"
# puts "fib_i(4): #{fib_i(4)}"
# puts "fib_i(5): #{fib_i(5)}"
# puts "fib_i(6): #{fib_i(6)}"
# puts "fib_i(7): #{fib_i(7)}"
# puts "fib_i(8): #{fib_i(8)}"
# puts "fib_i(9): #{fib_i(9)}"

