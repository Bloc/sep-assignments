require_relative 'open_addressing'

star_wars_movies = OpenAddressing.new(6)

puts " "
puts "Open Addressing Test"
puts " "
puts "Adding 1 Value"
star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"
star_wars_movies.status
puts " "
puts "Adding 2nd Value"
star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"
star_wars_movies.status
puts " "
puts "Adding 3rd Value"
star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"
star_wars_movies.status
puts " "
puts "Adding 4th Value"
star_wars_movies["Star Wars: A New Hope"] = "Number Four"
star_wars_movies.status
puts " "
puts "Adding 5th Value"
star_wars_movies["Star Wars: The Empire Strikes Back"] = "Number Five"
star_wars_movies.status
puts " "
puts "Adding 6th Value"
star_wars_movies["Star Wars: Return of the Jedi"] = "Number Six"
star_wars_movies.status
puts "Adding 7th Value"
star_wars_movies["Gobbledeegook"] = "Number Seven"
star_wars_movies.status
puts " "
puts"Adding 8th Value"
star_wars_movies["Young Anakin is dumb"] = "Number Eight"
star_wars_movies.status
puts " "
puts"Adding 9th Value"
star_wars_movies["Disney has devastaed the franchise..."] = "Number Nine"
star_wars_movies.status
puts " "
puts "Adding 10th Value"
star_wars_movies["Still going"] = "Number Ten"
star_wars_movies.status
puts " "
puts "Adding 11th Value"
star_wars_movies["Another One"] = "Number Eleven"
star_wars_movies.status
puts " "
puts "Adding 12th Value"
star_wars_movies["And again"] = "Number Twelve"
star_wars_movies.status
puts " "
puts "Adding 13th Value"
star_wars_movies["Childhood Ruined"] = "Number Thirteen"
star_wars_movies.status
