require_relative 'node'

class Graph
  def initialize(root)
    @root = root
  end

  def find_kevin_bacon(start, root)
    set_bacon_number(root)
    current = start
    #puts current.bacon_number
    current.film_actor_hash.each do |key, value|
      value.each do |v|
        #puts "#{key}: #{v.name}, #{v.bacon_number}\n"
        if v.bacon_number < current.bacon_number
          puts "#{key}\n"
          #puts v, v.name
          #puts current, current.name
          current = v
          find_kevin_bacon(current, root)
          #puts current, current.name
          if current.bacon_number == 0
            break
          end
        end
      end
    end
  end

  def set_bacon_number(root)
    level = 0
    def set_number(root, level)
      if root.bacon_number == nil
        root.bacon_number = level
        level = root.bacon_number + 1
      end
      children = root.get_children
      children.each do |c|
        if c.bacon_number == nil
          set_number(c, level)
        end
      end
    end
    set_number(root, level)
  end
end
