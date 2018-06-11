require_relative 'separate_chaining'

star_wars_movies = SeparateChaining.new(7)



puts star_wars_movies.size
star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"
puts "1 added"
star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"
puts "2 added"
star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"
puts "3 added"
star_wars_movies["Star Wars: A New Hope"] = "Number Four"
puts "4 added"
star_wars_movies["Star Wars: The Empire Strikes Back"] = "Number Five"
puts "5 added"
puts star_wars_movies.size

#star_wars_movies.items.each_with_index do |i, index|
  #nodes = []
  #if !i.is_empty
    #i.print_nodes.each do |i|
     #nodes << i
   #end
 #end
 #puts "At index #{index}:"
 #puts nodes
#end
