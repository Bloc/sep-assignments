require_relative 'node'

class Graph
  def find_kevin_bacon(start)
    queue = []
    found = false
    queue.push(start)
    while(queue.size != 0)
      node = queue.shift
      node.film_actor_hash.each do |movie, actor_nodes|
        if !start.path_array.include?(movie)
          start.path_array.push(movie)
        end
        actor_nodes.each do |actor|
          if actor.name != "Kevin Bacon" && actor.visited == false
            queue.push(actor)
            actor.visited = true
          end
          if actor.name == "Kevin Bacon"
            found = true
            return start.path_array
          end
        end
      end
    end
    return "Not Connected to Kevin Bacon"
  end

  def reset(hash)
    hash.each do |movie, actor_nodes|
      actor_nodes.each do |actor|
        actor.visited = false
      end
    end
  end
end
