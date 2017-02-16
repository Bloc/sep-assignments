def goodbye_world(n)
 puts "Goodbye World! #{n}"
end

def find_largest(collection)
 largest = collection[0]
 collection.length.times do |i|
   if collection[i] >= largest
     largest = collection[i]
   end
 end
 largest
end

def find_largest_2d(collection)
 largest = collection[0][0]
 collection.length.times do |i|
   subcollection = collection[i]
   subcollection.length.times do |i|
     if subcollection[i] >= largest
       largest = subcollection[i]
     end
   end
 end
 largest
end

def fib(n)
 if (n == 0)
   return 0
 elsif (n == 1)
   return 1
 else
   return fib(n-1) + fib(n-2)
 end
end

puts "#{fib(1)}"
puts "#{fib(2)}"
puts "#{fib(3)}"
puts "#{fib(4)}"
puts "#{fib(5)}"
puts "#{fib(6)}"
puts "#{fib(7)}"
puts "#{fib(8)}"
puts "#{fib(9)}"
puts "#{fib(10)}"

def iterative(n)
 num1 = 0
 num2 = 1

 i = 0
 while i < n-1
   tmp = num1 + num2
   num1 = num2
   num2 = tmp
   i+=1
 end

 num2
end

def sort(collection, from=0, to=nil)
 if to == nil
   # Sort the whole collection, by default
   to = collection.count - 1
 end

 if from >= to
   # Done sorting
   return
 end

 # Take a pivot value, at the far left
 pivot = collection[from]

 # Min and Max pointers
 min = from
 max = to

 # Current free slot
 free = min

 while min < max
   if free == min # Evaluate collection[max]
     if collection[max] <= pivot # Smaller than pivot, must move
       collection[free] = collection[max]
       min += 1
       free = max
     else
       max -= 1
     end
   elsif free == max # Evaluate collection[min]
     if collection[min] >= pivot # Bigger than pivot, must move
       collection[free] = collection[min]
       max -= 1
       free = min
     else
       min += 1
     end
   else
     raise "Inconsistent state"
   end
 end

 collection[free] = pivot

 quick_sort collection, from, free - 1
 quick_sort collection, free + 1, to

 collection
end
