def linear(n)
  for i in 0...n
    iterations = 2**i
    puts "#{i} => #{iterations}" 
  end
end

puts linear(11)