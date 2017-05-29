include RSpec

require_relative 'graph'
require_relative 'node'

graph = Graph.new
kevin_bacon = Node.new("Kevin Bacon")

lori_singer = Node.new("Lori Singer")
john_lithgow = Node.new("John Lithgow")
dianne_west = Node.new("Dianne West")
chris_penn = Node.new("Chris Penn")
sara_jessica_parker = Node.new("Sara Jessica Parker")
matthew_mcconaughey = Node.new("Matthew McConaughey")
leonardo_dicaprio = Node.new("Leonardo DiCaprio")
gene_hackman = Node.new("Gene Hackman")
clint_eastwood = Node.new("Clint Eastwood")
hilary_swank = Node.new("Hilary Swank")
robert_deniro = Node.new("Robert De Niro")
jodie_foster = Node.new("Jodie Foster")
kim_cattrall = Node.new("Kim Cattrall")
fake = Node.new("Fake")

film_hash = Hash.new
film_hash["Footloose"] = [kevin_bacon, lori_singer, john_lithgow, dianne_west, chris_penn, sara_jessica_parker]
film_hash["Interstellar"] = [john_lithgow, matthew_mcconaughey]
film_hash["The Wolf Of Wall Street"] = [matthew_mcconaughey, leonardo_dicaprio]
film_hash["The Birdcage"] = [dianne_west, gene_hackman]
film_hash["Absolute Power"] = [gene_hackman, clint_eastwood]
film_hash["Million Dollar Baby"] = [clint_eastwood, hilary_swank]
film_hash["Taxi Driver"] = [robert_deniro, jodie_foster]
film_hash["Sleepers"] = [kevin_bacon, robert_deniro]
film_hash["Sex And The City"] = [sara_jessica_parker, kim_cattrall]

kevin_bacon.set_films(film_hash)
lori_singer.set_films(film_hash)
john_lithgow.set_films(film_hash)
dianne_west.set_films(film_hash)
chris_penn.set_films(film_hash)
sara_jessica_parker.set_films(film_hash)
matthew_mcconaughey.set_films(film_hash)
leonardo_dicaprio.set_films(film_hash)
gene_hackman.set_films(film_hash)
clint_eastwood.set_films(film_hash)
hilary_swank.set_films(film_hash)
robert_deniro.set_films(film_hash)
jodie_foster.set_films(film_hash)
kim_cattrall.set_films(film_hash)
fake.set_films(film_hash)

puts "Leonardo DiCaprio: #{graph.find_kevin_bacon(leonardo_dicaprio)}"
graph.reset(film_hash)
puts "Kim Cattrall: #{graph.find_kevin_bacon(kim_cattrall)}"
graph.reset(film_hash)
puts "Hilary Swank: #{graph.find_kevin_bacon(hilary_swank)}"
graph.reset(film_hash)
puts "Fake: #{graph.find_kevin_bacon(fake)}"
