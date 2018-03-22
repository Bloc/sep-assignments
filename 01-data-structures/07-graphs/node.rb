class Node
  attr_accessor :name, :film_actor_hash, :predecessor

  def initialize(name)
    @name = name
    @film_actor_hash = Hash.new()
    @predecessor = Array.new()
  end
end
