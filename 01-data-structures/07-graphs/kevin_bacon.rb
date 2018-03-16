require_relative 'node.rb'

# Write a function that begins at a provided Node object and returns an Array of at most six film titles that connect it to the Kevin_Bacon Node.
# each actor is a node
# each edge is a film where both actors starred

class Graph

  def initialize
    @checked_actors = []
    @path_array = []
  end

  def find_kevin_bacon(start)
    #add starting actor to checked_actors list
    @checked_actors.push(start)

    #return empty array if Kevin Bacon is passed in
    return @path_array if start.name == 'Kevin Bacon'

    #while there are actors in the queue
    while @checked_actors.length != 0 do
      node = @checked_actors.shift()

      node.film_actor_hash.each do |film, cast|
        @path_array.push(film) unless @path_array.include?(film)
        cast.each do |actor|
          #if the actor is not already in the queue and not Kevin Bacon, add actor to queue
          if actor.name != "Kevin Bacon" && !@checked_actors.include?(actor)
            @checked_actors.push(actor)
          #if the actor is kevin bacon, great you found him return the path to him
          elsif actor.name == "Kevin Bacon"
            return @path_array
          end #if
        end #each actor in cast
      end #each film in hash
    end #while

  end #def
end #class
