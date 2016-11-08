include 'node'

def find_kevin_bacon(film_actor)
  film_array = false

  film_actor.film_actor_hash.each do |title, actors|
    actors.each do |actor|
      if actor == "Kevin Bacon"
        film_array = [title]
      else
        actor_film_array = find_kevin_bacon(film_actor)
        if actor_film_array
          actor_film_array.pop(title)
          film_array = actor_film_array
        end
      end
    end
  end

  if film_array && film_array.length <= 6
    puts "Connected by these #{film_array.length} movies: #{film_array}"
  else
    puts "Not connected by 6 or less movies"
  end
end
