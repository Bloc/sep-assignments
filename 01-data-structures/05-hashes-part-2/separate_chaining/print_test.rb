require_relative 'node'
require_relative 'linked_list'
require_relative 'separate_chaining'

star_wars_movies = SeparateChaining.new(6)
star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"
star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"
star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"
star_wars_movies["Star Wars: A New Hope"] = "Number Four"
star_wars_movies["Star Wars: The Empire Strikes Back"] = "Number Five"
star_wars_movies["Star Wars: Return of the Jedi"] = "Number Six"

star_wars_movies.print_all_the_things
