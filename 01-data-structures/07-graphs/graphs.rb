require_relative 'node'

class Graphs 

	attr_accessor :visited_actors

	def initialize
		@visited_actors = Array.new
	end

	def find_kevin_bacon(node) 
		films = []

		visited_actors.push(node) #place actor node in visited actor array
		#search actors in movie
		node.film_actor_hash.each do |title, actors| #check for bacon
			actors.each do |actor|
				if actor.name === "Kevin Bacon"
					films.push(title)
					#puts title
					return films
				end
			end

			actors.each do |actor|
				#puts actor.name
				if !@visited_actors.include?(actor)
					tempFilms = find_kevin_bacon(actor)
					if !tempFilms.empty?
						films.push(title)
						films += tempFilms
					end
				end
			end
		end


		if (films.length > 0 && films.length <= 6)
			puts "Actor is withing 6 degrees"
			return films 
		else
			puts "Actor is not connected to Bacon within 6 degrees of seperation"
			return films
		end

		return films
	end

end