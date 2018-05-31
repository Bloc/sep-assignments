require_relative 'myqueue'

q = MyQueue.new

q.enqueue("Rob")
q.enqueue("Bob")

puts q.head
