require_relative 'open_addressing'

star_wars_movies = OpenAddressing.new(6)



star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"
star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"
star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"
star_wars_movies["Star Wars: A New Hope"] = "Number Four"
star_wars_movies["Star Wars: The Empire Strikes Back"] = "Number Five"
star_wars_movies["Star Wars: Return of the Jedi"] = "Number Six"
star_wars_movies["Gobbledeegook"] = "Number Seven"
star_wars_movies["Young Anakin is dumb"] = "Number Eight"
star_wars_movies["Disney has devastaed the franchise..."] = "Number Nine"
star_wars_movies["Still going"] = "Number Ten"
star_wars_movies["Another One"] = "Number Eleven"
star_wars_movies["And again"] = "Number Twelve"
star_wars_movies["Childhood Ruined"] = "Number Thirteen"

star_wars_movies.status
