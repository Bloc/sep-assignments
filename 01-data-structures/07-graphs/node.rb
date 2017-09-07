class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
  attr_accessor :index

  def initialize(name)
    self.name = name
    self.film_actor_hash = {}
  end
  
  def add_movie(movie)
    arr = self.film_actor_hash[movie]
    if arr == nil
      arr = []
      self.film_actor_hash[movie] = arr
    end
  end
  
  def add_actor(movie, node)
    arr = self.film_actor_hash[movie]
    if arr == nil
      return nil
    end
    arr.each do |node1|
      if node1.name == node.name
        return
      end
    end
    arr.push(node)
    return true
  end
  
  def find(movie)
    return self.film_actor_hash[movie]
  end
  
  def connected_actors
    retval = []
    self.film_actor_hash.each do |movie, actors|
      actors.each do |actor|
        unless retval.include?(actor)
          retval.push(actor)
        end
      end
    end 
    return retval
  end

end