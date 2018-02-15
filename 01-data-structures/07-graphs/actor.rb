require_relative 'film'

class Actor
  attr_accessor :name
  attr_accessor :list_of_films
  attr_accessor :iterated

  def initialize(name)
    @name = name
    @list_of_films = []
    @iterated = false
  end

  def add_actor_to_film(film)
    film.actors.push(self)
    self.list_of_films.push(film)
  end

  def find_kevin_bacon(link=[], current_actor=self)
    # iterate through actor's list_of_films
    current_actor.list_of_films.each do |film|
      # add each film name to films array
      title = film.name
      unless link.include?(title)
        link.push(title)
      end
      # print films array once Kevin is connected
      if film.actors.include?(Kevin_Bacon)
        puts link
      else
        # check off current actor as iterated
        current_actor.iterated = true
        # iterate through rest of actors
        film.actors.each do |actor|
          # recursive search through unlink actors
          if actor.iterated == false
            actor.find_kevin_bacon(link, current_actor=actor)
          end
        end
      end
    end
  end

  def film_actor_hash(film)
    if film.actors.include?(self)
      film.actors.each do |actor|
        unless actor == self
          puts actor.name
        end
      end
    else
      puts "Actor did not cast in this film."
    end
  end
end
