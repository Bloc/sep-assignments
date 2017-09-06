class Node
    attr_accessor :name
    attr_accessor :film_actor_hash
    
    def initialize(name)
        self.name = name
        self.film_actor_hash = {}
    end

end