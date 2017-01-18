require 'benchmark'
include Benchmark

def insertion_sort(collection)
   # #1
   sorted_collection = [collection.delete_at(0)]

   for val in collection
     sorted_collection_index = 0
     # #2
     while sorted_collection_index < sorted_collection.length
       if val <= sorted_collection[sorted_collection_index]
         # #3
         sorted_collection.insert(sorted_collection_index, val)
         break
       elsif sorted_collection_index == sorted_collection.length - 1
         # #4
         sorted_collection.insert(sorted_collection_index + 1, val)
         break
       end

       sorted_collection_index += 1
     end
   end

   sorted_collection
 end

  def selection_sort(collection)
   length = collection.length
   # #1
   for i in 0..length - 2
     # #2
     min_index = i
     # #3
     for j in (i + 1)...length
       if collection[j] < collection[min_index]
         # #4
         min_index = j
       end
     end

     # #5
     tmp = collection[i]
     collection[i] = collection[min_index]
     collection[min_index] = tmp
   end
   collection
 end

  def bubble_sort(collection)
   n = collection.length
   # #1
   begin
     swapped = false

     # #2
     (n - 1).times do |i|
       # #3
       if collection[i] > collection[i + 1]
         tmp = collection[i]
         collection[i] = collection[i + 1]
         collection[i + 1] = tmp
         swapped = true
       end
     end
   end until not swapped

   collection
 end

 ###############
  def merge_sort(collection)
   # #1
   if collection.length <= 1
     collection
   else
     # #2
     mid = (collection.length / 2).floor
     left = merge_sort(collection[0..mid - 1])
     right = merge_sort(collection[mid..collection.length])
     # #3
     merge(left, right)
   end
 end

 def merge(left, right)
   if left.empty?
     # #4
     right
   elsif right.empty?
     # #5
     left
   elsif left.first < right.first
     # #6
     [left.first] + merge(left[1..left.length], right)
   else
     # #7
     [right.first] + merge(left, right[1..right.length])
   end
 end

 ############

def quicksort(array)
   return nil if array.empty?

   pivot = array.delete(array.last)

   left, right = array.partition(&pivot.method(:>))

   return *quicksort(left), pivot, *quicksort(right)
end

class Array
	def heapsort!
		#heapify
		1.upto(self.length - 1) do |i|
			#move up
			child = i
			while child > 0
				parent = (child - 1) / 2
				if self[parent] < self[child]
					self[parent], self[child] = self[child], self[parent]
					child = parent
				else
					break
				end
			end
		end

		#sort
		i = self.length - 1
		while i > 0
			self[0], self[i] = self[i], self[0]
			i -= 1

			#move down
			parent = 0
			while parent * 2 + 1 <= i
				child = parent * 2 + 1
				if child < i && self[child] < self[child + 1]
					child += 1
				end
				if self[parent] < self[child]
					self[parent], self[child] = self[child], self[parent]
					parent = child
				else
					break
				end
			end
		end
	end
end


def bucket_sort(array, max)
  buckets = Array.new(max+1, 0)
  array.each do |i|
    buckets[i] += 1
  end

  sorted = []
  buckets.each_index do |index|
    buckets[index].times { sorted << index }
  end
  sorted
end


array = (1..5000).to_a.shuffle

Benchmark.bmbm do |x|
  x.report("insertion_sort") { insertion_sort(array) }
  x.report("selection_sort")  { selection_sort(array) }
  x.report("bubble_sort")  { bubble_sort(array) }
  x.report("merge_sort")  { merge_sort(array) }
  x.report("quicksort")  { quicksort(array) }
  x.report("bucket_sort")  { bucket_sort(array, array.last) }
end
