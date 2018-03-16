class Node
  attr_accessor :name, :film_actor_hash

  def initialize(name)
    @name = name
    @film_actor_hash = Hash.new()
  end
end

class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
  attr_accessor :films

  def initialize(name)
    @name = name
    @film_actor_hash = Hash.new
    @films = []
  end
end
