require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

MyList = LinkedList.new
MyArray = []

Benchmark.bm do |x|
	x.report("Push 10,000 items to MyArray") { 
		n = 0; 
		while n < 10000; 
			MyArray.push(n.to_s); 
			n += 1; 
		end 
	}
	x.report("Append 10,000 items to MyList") { 
		n = 0; 
		while n < 10000; 
			MyList.add_to_tail( Node.new(n.to_s) ); 
			n += 1; 
		end 
	}

	x.report("Find 5,000th item in MyArray") { 
		MyArray[4999] 
	}
	x.report("Find 5,000th item in MyList") { 
		MyList.find_node(4999.to_s) 
	}


	x.report("Delete 5,000th item in MyArray") { 
		MyArray.delete_at(4999) 
	}
	x.report("Delete 5,000th item in MyList") { 
		MyList.delete( MyList.find_node(4999.to_s) )
	}
end

