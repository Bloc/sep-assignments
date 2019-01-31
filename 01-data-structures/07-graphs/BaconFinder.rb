require_relative 'Node'

class BaconFinder
  attr_accessor :visited

  def initialize
    @visited = Array.new
  end

  def find_kevin_bacon(actor)
    films = []
    @visited << actor

    actor.film_actor_hash do |title, actors|
      actors.each do |a|
        if a == "Kevin Bacon"
          films << title
          if !@visited.include?(a)
            temp = find_kevin_bacon(a)
            films << title #<< is adding a string to array
            films += temp #+= mathematical equation adds an array to an array (resulting in just one single array without nested arrays)
          end
        end
      end
    end
    (films.length <= 6 && films.length > 0) ? (puts "Connected by films: #{films.all}") : (puts "Not connected by 6 or less films")
  end
end

