require_relative 'node'

class Graph

    def initialize
        @movie_list = []
        #@visited = []
    end

    def find_kevin_bacon(start_actor)
        if start_actor.name === "Kevin Bacon"
            return "I guess, technically, Kevin Bacon is 0 degrees seperated from from Kevin Bacon"
        end
        
        start_actor.film_actor_hash.each do |movie, actors|
            actors.each do |actor|
                if actor.name == "Kevin Bacon"
                    @movie_list.push(movie)
                    return @movie_list
                else
                    @movie_list.push(movie) unless @movie_list.include?(movie)
                    find_kevin_bacon(actor)
                end
                #@visited.push(actor.name)
            end
    
            if @movie_list.length > 6
                return "#{start_actor.name} is more than 6 degrees from Kevin Bacon."
            else
                return @movie_list
            end
        end
    end
end