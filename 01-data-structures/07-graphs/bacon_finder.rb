require_relative 'actor_node'

class BaconFinder
  attr_accessor :visited

  def initialize
    @visited = Array.new
  end

  def find_kevin_bacon(actor)
    movies = []
    @visited << actor
    actor.film_actor_hash.each do |movie, actors|
      actors.each do |actor|
        movies << movie
        break if actor.name === 'Kevin Bacon'
        if !@visited.include?(actor)
          temp = find_kevin_bacon(actor)
          movies += temp
        end
      end
    end
    if movies.uniq.length > 6
      puts "Somehow, there are more than six degrees of separation b/w this actor and Mr. Bacon"
    end
    movies.uniq
  end

end
