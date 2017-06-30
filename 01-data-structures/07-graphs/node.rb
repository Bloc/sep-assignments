class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
  attr_accessor :path_array
  attr_accessor :visited

  def initialize(name)
    @name = name
    @path_array = []
    @visited = false
  end

  def set_films(films)
    @film_actor_hash = Hash.new
    films.each do |key, value|
      value.each do |node|
        if node.name == name
          @film_actor_hash[key] = value
          @film_actor_hash[key] -= [node]
        end
      end
    end
  end
end
