require_relative 'graphs'
require_relative 'node'

Kevin_Bacon = Actor.new("Kevin Bacon")
Daniel_Radcliffe = Actor.new("Daniel Radcliffe")
Emma_Watson = Actor.new("Emma Watson")
John_Cleese = Actor.new("John Cleese")
Brendan_Gleeson = Actor.new("Brendan Gleeson")

The_Big_Picture = Film.new("The Big Picture")

Kevin_Bacon.add_to_film(The_Big_Picture)
John_Cleese.add_to_film(The_Big_Picture)

Harry_Potter_and_the_Sorcerers_Stone = Film.new("Harry Potter and the Sorcerer's Stone")

Daniel_Radcliffe.add_to_film(Harry_Potter_and_the_Sorcerers_Stone)
Emma_Watson.add_to_film(Harry_Potter_and_the_Sorcerers_Stone)
John_Cleese.add_to_film(Harry_Potter_and_the_Sorcerers_Stone)

Harry_Potter_and_the_Goblet_of_Fire = Film.new("Harry Potter and the Goblet of Fire")

Daniel_Radcliffe.add_to_film(Harry_Potter_and_the_Goblet_of_Fire)
Emma_Watson.add_to_film(Harry_Potter_and_the_Goblet_of_Fire)
Brendan_Gleeson.add_to_film(Harry_Potter_and_the_Goblet_of_Fire)

Brendan_Gleeson.find_kevin_bacon

