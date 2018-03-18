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
    return @path_array if start.name == 'Kevin Bacon'
    @checked_actors.push(start) unless @checked_actors.include?(start)

    start.film_actor_hash.each do |film, cast|
      cast.each do |actor|
        if actor.name == "Kevin Bacon"
          @path_array.push(film) unless @path_array.include?(film)
          return @path_array
        elsif !@checked_actors.include?(actor)
          @path_array.push(film) unless @path_array.include?(film)
          @checked_actors.push(actor)
          return find_kevin_bacon(actor)
        else
          return
        end #if
      end #cast.each
    end # film_hash.each
  end #def
  
end #class
