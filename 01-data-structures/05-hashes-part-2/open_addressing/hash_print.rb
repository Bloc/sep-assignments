require_relative 'open_addressing'

myHash = OpenAddressing.new(5)

myHash["Star Wars: The Phantom Menace"] = "Number One"
myHash["Star Wars: Attack of the Clones"] = "Number Two"
myHash["Star Wars: Revenge of the Sith"] = "Number Three"
myHash["Star Wars: A New Hope"] = "Number Four"
myHash["Star Wars: The Empire Strikes Back"] = "Number Five"
myHash["Star Wars: Return of the Jedi"] = "Number Six"

puts myHash.status
