require 'benchmark'

require_relative 'node'
require_relative 'linked_list'

Array = []
List = LinkedList.new

Benchmark.bm do |x|
  x.report("Push 10,000 items to Array") { 
    n = 0; 
    while n < 10000; 
      Array.push(n.to_s); 
      n += 1; 
    end 
  }
  x.report("Append 10,000 items to List") { 
    n = 0; 
    while n < 10000; 
      List.add_to_tail( Node.new(n.to_s) ); 
      n += 1; 
    end 
  }

  x.report("Find 5,000th item in Array") { 
    Array[4999] 
  }
  x.report("Find 5,000th item in List") { 
    List.find_node(4999.to_s) 
  }


  x.report("Delete 5,000th item in Array") { 
    Array.delete_at(4999) 
  }
  x.report("Delete 5,000th item in List") { 
    List.delete( List.find_node(4999.to_s) )
  }
end