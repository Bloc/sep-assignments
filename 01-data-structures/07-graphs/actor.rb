include 'film'

class KevinBacon

  def find_kevin_bacon(actor)
    films = []
    actor.film_actor_hash.each do |title, actors|
      actors.each do |actor|
        if actor == "Kevin_Bacon"
           films.push(title)
        else
           find_kevin_bacon(actor)
        end
      end
    end

    #returns an Array of at most six film titles that connect it to the Kevin_Bacon Node
    if (films.length <= 6 && films.length > 0) 
    	p "Connected by films: #{films.all}" 
    else 
    	p "Not connected by 6 or less films"
    end
  end
end