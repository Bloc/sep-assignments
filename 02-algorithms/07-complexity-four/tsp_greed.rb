cities_visited = {A: false, B: false, C: false, D: false}

A.neighbors = [B = 2, C = 3, D = 11]
B.neighbors = [A = 2, C = 4, D = 10]
C.neighbors = [A = 3, B = 4, D = 9]
D.neighbors = [A = 11, B = 10, C = 9]

 def nearest_possible_neighbor(cities_graph, current_city)
   all_cities_visited = false

   while all_cities_visited == false
     neighbor_cities = current_city.neighbors
     next_city = nil
     for i in 0..neighbor_cities.length -1
       if cities_visited[:neighbor_cities[i]] == false
         next_city = neighbor_cities[i]
         break
       end
     end
     return if next_city == nil
     for i in 0..neighbor_cities.length -1
       if neighbor_cities[i].distance < next_city.distance && cities_visited[:neighbor_cities[i]] == false
         next_city = neighbor_cities[i]
       end
     end
     cities_visited[:current_city] = true
     current_city = next_city

     cities_visited.each do |value|
       if value == true
         all_cities_visited = true
       else
         all_cities_visited = false
         break
       end
     end
   end

ab = 2
ac = 3
ad = 11
bc = 4
bd = 10
cd = 9
