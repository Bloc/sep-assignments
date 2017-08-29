require 'benchmark'
require_relative 'heap'

root = Node.new(0,0)
tree = Heap.new(root)

numbers = []
(0...10000).each do |i|
    numbers.push(i)
end

Benchmark.bm(7, "task", "user", "system", "total", "real") do |x|
    x.report("insert") do
        (1...10000).each do |i|
            tree.insert(Node.new(i, i))
        end
    end
    
    x.report("find") do
        tree.find(5000)
    end
    
    x.report("delete") do
        tree.delete(5000)
    end
            
end

# RESULTS

#              user     system      total        real
# insert    0.190000   0.000000   0.190000 (  0.204929)
# find      0.000000   0.000000   0.000000 (  0.000296)
# delete    0.000000   0.000000   0.000000 (  0.000138)


# Now, shuffled:
numbers = numbers.shuffle

Benchmark.bm(7, "task", "user", "system", "total", "real") do |x|
    x.report("insert") do
        (1...10000).each do |i|
            tree.insert(Node.new(i, i))
        end
    end
    
    x.report("find") do
        tree.find(5000)
    end
    
    x.report("delete") do
        tree.delete(5000)
    end
            
end

# Shuffled RESULTS
#               user     system      total        real
# insert    0.040000   0.000000   0.040000 (  0.030056)
# find      0.000000   0.000000   0.000000 (  0.002133)
# delete    0.000000   0.000000   0.000000 (  0.001337)