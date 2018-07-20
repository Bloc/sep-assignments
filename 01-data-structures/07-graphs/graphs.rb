require_relative 'node'

class Actor
  attr_accessor :name
  attr_accessor :filmography
  attr_accessor :checked

  def initialize(name)
    @name = name
    @filmography = Array.new
    @checked = false
  end

  def add_to_film(film)
    film.cast.push(self)
    @filmography.push(film)
  end

  def film_actor_hash(film)
    if film.cast.include?(self)
      film.cast.each do |i|
        unless i == self
          puts i.name
        end
      end
    else
      puts "That actor was not in that film. Try again."
    end
  end

  def find_kevin_bacon(films=[], currentActor=self)
    if currentActor == Kevin_Bacon
      return 0
    else
      currentActor.filmography.each do |film|
        unless films.include?(film.name)
          films.push(film.name)
        end
        if film.cast.include?(Kevin_Bacon)
          puts films
        else
          currentActor.checked = true
          film.cast.each do |actor|
            if actor.checked == false
              actor.find_kevin_bacon(films, currentActor=actor)
            end
          end
        end
      end
    end
  end
end