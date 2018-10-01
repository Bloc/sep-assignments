require_relative 'node'

class Graph

  def initialize(node)
    @film_list = Array.new
    @actor_list = Array.new
    @target_actor = node
  end

  def find_kevin_bacon(start_actor)
    @actor_list << start_actor.name

    @target_actor.film_actor_hash.each do |title, actor|
      actor.each do |actor|
        if actor.name === start_actor.name
          @film_list << title
          puts "#{@film_list}"
        end
      end
    end

    if @film_list.length >= 6 || start_actor.film_actor_hash.empty?
      return nil
    end

    start_actor.film_actor_hash.each do |title, actor|
      @film_list << title
      actor.each do |actor|
        if @actor_list.include? actor.name
          return nil
        else
          if actor.name === @target_actor.name
            puts "#{@film_list}"
          else
            find_kevin_bacon(actor)
          end
        end
      end
    end
  end

end
