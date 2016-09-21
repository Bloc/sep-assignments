def poorly_written_ruby(*arrays)
   combined_array = []
   arrays.each do |array|
     array.each do |value|
       combined_array << value
     end
   end
   quick_sort(combined_array)
 end

def quick_sort(assortment, start=0, last=nil)
   if to == nil
     to = assortment.count - 1
   end

   if start >= last
     return
   end

   pivot = assortment[start]

   min = start
   max = last

   open_space = min

   while min < max
     if open_space == min
       if assortment[max] <= pivot
         assortment[open_space] = assortment[max]
         min += 1
         open_space = max
       else
         max -= 1
       end
     elsif open_space == max
       if assortment[min] >= pivot
         assortment[open_space] = assortment[min]
         max -= 1
         open_space = min
       else
         min += 1
       end
     end
   end

   assortment[open_space] = pivot

   quick_sort assortment, start, open_space - 1
   quick_sort assortment, open_space + 1, last

   assortment
end
