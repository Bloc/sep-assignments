class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
  attr_accessor :bacon_number

  def initialize(name)
    @name = name
    @film_actor_hash = Hash.new {}
    @bacon_number = nil
  end

  def add(movie, actors)
    @film_actor_hash[movie] = actors
  end

  def get_children
    children = []
    @film_actor_hash.each do |key, value|
      value.each do |v|
        children.push(v)
      end
    end
    return children
  end
end
