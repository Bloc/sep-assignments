require_relative 'node.rb'

# Write a function that begins at a provided Node object and returns an Array of at most six film titles that connect it to the Kevin_Bacon Node.
# each actor is a node
# each edge is a film where both actors starred

class Graph
  def initialize
    @checked_actors = []
  end

  def bfs(node, kevin_bacon)
    return "You want to find Kevin Bacon from Kevin Bacon? What is this insanity?" if node == kevin_bacon

    queue = []
    queue << node
    @checked_actors << node

    while queue.any?
      current_node = queue.shift
      current_node.film_actor_hash.each do |film, cast_list|
        if cast_list.include?(kevin_bacon)
          #great we found kevin_bacon, no need to add neighbors to queue or keep going
          #terminate search and return film path to get from kevin_bacon to node (this is where I'm stuck - relies on marking the predecesssors as the graph is searched)
          return construct_path(current_node, film)
        else
          cast_list.each do |actor|
            next if @checked_actors.include?(actor) || queue.include?(actor)
            #mark predecessor of this child as the current node and current film
            actor.predecessor.push(film).push(current_node)
            queue << actor
            @checked_actors << actor
          end #each actor
        end #if
      end #each cast_list
    end #while

    # if queue is empty then all children have been checked and kevin bacon was not found
    "Kevin Bacon not found."
  end #def bfs

  # construct_path build a film_path using predecesors for kevin_bacon back to start_node and returns film_path
  def construct_path(current_node, last_film)
    path = [last_film]
    return path if current_node.predecessor.empty?

    while current_node.predecessor[1]
      path.unshift(current_node.predecessor[0])
      return "Kevin Bacon is more than 6 connections away." if path.length > 6
      current_node = current_node.predecessor[1]
    end
    path
  end #def construct_path

end #class
