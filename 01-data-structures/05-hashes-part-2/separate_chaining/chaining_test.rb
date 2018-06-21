require_relative 'separate_chaining'

star_wars_movies = SeparateChaining.new(4)



star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"
star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"
star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"
star_wars_movies["Star Wars: A New Hope"] = "Number Four"

star_wars_movies.status


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
