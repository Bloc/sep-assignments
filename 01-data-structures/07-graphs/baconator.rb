include 'node'

def find_kevin_bacon(node)
  final_array = false

  node.film_actor_hash.each do |title, actors|
    actors.each do |actor|
      if actor == "Kevin_Bacon"
        final_array = [title]
        break
      else
        actor_final_array = find_kevin_bacon(actor)
        if actor_final_array
          actor_final_array.unshift(title)
          final_array = actor_final_array
        end
      end
    end
  end

  if final_array && final_array.length <= 6
    return final_array
  else
    return false
  end
end

#we store the results of the kevin bacon film list

#node
