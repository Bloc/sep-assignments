include 'node'

class KevinBacon

  def find_kevin_bacon(actor)
    # Find the Baconator
    films = []
    actor.film_actor_hash do |title, actors|
      actors.each do |actor|
        if actor == "Kevin Bacon"
          films.push(title)
        else
          find_kevin_bacon(actor)
        end
      end
    end
    (films.length <= 6 && films.length > 0) ? puts "Connected by films: #{films.all}" : puts "Not connected by 6 or less films"
  end

end