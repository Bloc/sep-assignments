# Nearest Neighbor
# Assume each city has #neighbors[] and boolean of "visited" set equal to false
# Assume each city has a distance variable associated to its neighbor cities
# Assume you have an [] of graphical cities


 def nearest_possible_neighbor(graph_of_cities, current_city)
   while current_city.visited == false do
    neighbor_cities = current_city.neighbors
    next_city = neighbor_cities[0]

    for current_neighbor in neighbor_cities
      if current_neighbor.distance < next_city.distance
        current_neighbor = next_city
      end
    end

    current_city.visited = true
    next_city = current_city
  end
  # if you wanted to transform this into a route generator, you could call recursion here #nearest_possible_neighbor(graph_of_cities, next_city)
 end
