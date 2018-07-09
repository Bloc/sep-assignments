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
      current_actor = ''
      actors.each do |a|
        current_actor = a.name
        movies << movie && break if current_actor === 'Kevin Bacon'
        if !@visited.include?(a)
          temp = find_kevin_bacon(a)
          movies << movie
          movies += temp
        end
      end
      break if current_actor === 'Kevin Bacon'
    end
    if movies.uniq.length > 6
      return "Somehow, there are more than six degrees of separation b/w this actor and Mr. Bacon"
    end
    movies.uniq
  end
end
