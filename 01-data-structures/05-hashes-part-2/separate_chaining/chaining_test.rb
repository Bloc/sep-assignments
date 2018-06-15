require_relative 'separate_chaining'

movies = SeparateChaining.new(6)
movies["A New Hope"] = "Average"
movies["Empire Strikes Back"] = "Excellent"
movies["Return of the Jedi"] = "The Best"
movies.resize

movies.status
movies["A New Hope"]
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
