def find_kevin_bacon(node_start, films_visited)
	fv = films_visited
	if node_start.nil?
		return nil
	elsif node_start.name == "Kevin Bacon"
		# puts "#{node_start.name} #{fv}"
		return fv
	else
		# puts "node:#{node_start.name} keys:#{node_start.film_actor_hash.keys} fv:#{fv}"

		node_start.film_actor_hash.each { |film, actors|
			# puts "film: #{film} fv:#{fv}"
			if fv.index(film).nil?
				fvp = fv + [film]
				actors.each { |actor|
					# puts "name: #{actor.name} keys:#{actor.film_actor_hash.keys} film:#{film} fvp:#{fvp}"
					fvr = find_kevin_bacon(actor, fvp)
					return fvr unless fvr.nil?
				}
			end
		}
		return nil
	end
end

def print_films(name_start, films)
	puts ""
	puts "Six Degrees of Bacon"
	puts "  from #{name_start}"
	films.each { |film| puts "    - #{film}" } unless films.nil?
	puts "  => to Kevin Bacon" unless films.nil?
end