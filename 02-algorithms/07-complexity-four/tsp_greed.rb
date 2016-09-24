A.neighbors = [B = 2, C = 3, D = 11]
B.neighbors = [A = 2, C = 4, D = 10]
C.neighbors = [A = 3, B = 4, D = 9]
D.neighbors = [A = 11, B = 10, C = 9]

 def nearest_possible_neighbor(cities_graph, current_city)
   while current_city == false
     neighbor_cities = current_city.neighbors
     next_city = neighbor_cities[0]

     for i in 0..neighbor_cities.length -1
      if cities_visited[:neighbor_cities[i]] == false
        next_city = neighbor_cities[i]
        break
      end
    end
    return next_city == nil

    for i in 0..neighbor_cities,length -1
      if neighbor_cities[i].distance < next_city.distance
        next_city = neighbor_cities[i]
      end
    end

    cities_visited[:current_city] = true
    current_city = next_city

    cities.each do |x|
      if x == true
        all_cities_visited = true
      else all_cities_visited = false
      end
    end
  end
end
