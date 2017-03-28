require_relative 'graph_of_cities'

def nearest_possible_neighbor(goc, start_city)
  current_city = start_city 
  total_distance = 0
  puts "Start at #{start_city}"
  while !goc.visited?(current_city)
    neighbor_cities = goc.not_yet_visited(current_city)
    if !neighbor_cities.empty?
      next_city = neighbor_cities[0]
      for current_neighbor in neighbor_cities
        if current_neighbor != next_city
          # puts "#{current_neighbor} vs #{next_city} from #{current_city}"
          cur_dist = goc.distance(current_city, current_neighbor)
          next_dist = goc.distance(current_city, next_city)
          # puts "#{cur_dist} #{next_dist}"
          if cur_dist < next_dist
            next_city = current_neighbor
            next_dist = cur_dist
          end
        end
      end
      total_distance += next_dist
      puts "travel #{next_dist}mi to #{next_city}"
    end
    goc.visited(current_city)
    current_city = next_city unless next_city.nil?
  end
  # puts "#{current_city} #{start_city}"
  next_dist = goc.distance(current_city, start_city)
  puts "travel #{next_dist}mi back to #{start_city}"
  total_distance += next_dist
  puts "Total distance travelled: #{total_distance}mi"
  puts ""
end

graph_of_cities = GraphOfCities.new("cities_short.txt")
# graph_of_cities.print_matrix
graph_of_cities.build_matrix
# graph_of_cities.print_matrix
nearest_possible_neighbor(graph_of_cities, "Albany, NY")
graph_of_cities.reset_visited
nearest_possible_neighbor(graph_of_cities, "Atlanta, GA")

graph_of_cities = GraphOfCities.new("cities_med_list.txt")
graph_of_cities.build_matrix
nearest_possible_neighbor(graph_of_cities, "Carson City, NV")
graph_of_cities.reset_visited
nearest_possible_neighbor(graph_of_cities, "Jackson, MS")
graph_of_cities.reset_visited
nearest_possible_neighbor(graph_of_cities, "Raleigh, NC")



