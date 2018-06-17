class Node

    attr_accessor :name, :film_actor_hash

    def initialize(name)
        # Pass in film name and returns all actors in that film
        @film_actor_hash = Hash.new
        @name = name
    end
end

bacon_list = []

def find_kevin_bacon(actor)
    return bacon_list if actor == "Kevin Bacon"
    if actor.film_actor_hash.each do |movie|
        if actor.film_actor_hash[movie].any? {|x| x == "Kevin Bacon"}
            bacon_list << movie
            find_kevin_bacon_for_real("Kevin Bacon")
        elsif bacon_list.length <= 6
            if actor.film_actor_hash[movie].each do |x|
                bacon_list << movie
                find_kevin_bacon_for_real(x)
            end
        else
            bacon_list = []
        end
    end
end