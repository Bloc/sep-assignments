require_relative 'actor'
require_relative 'film'

# list of movies
xmen = Film.new("X-Men: First Class")
hunger = Film.new("The Hunger Games")
independence = Film.new("Independence Day: Resurgence")
thor = Film.new("Thor: Ragnarok")
avengers = Film.new("The Avengers")

# list of actors
Kevin_Bacon = Actor.new("Kevin Bacon")
Jennifer_Lawrence = Actor.new("Jennifer Lawrence")
James_McAvoy = Actor.new("James McAvoy")
Josh_Hutcherson = Actor.new("Josh Hutcherson")
Liam_Hemsworth = Actor.new("Liam Hemsworth")
Jeff_Goldblum = Actor.new("Jeff Goldblum")
Bill_Pullman = Actor.new("Bill Pullman")
Cate_Blanchett = Actor.new("Cate Blanchett")
Tessa_Thompson = Actor.new("Tessa Thompson")
Scarlett_Johansson = Actor.new("Scarlett Johansson")
Chris_Evans = Actor.new("Chris Evans")
Robert_Downey_Jr = Actor.new("Robert Downey Jr.")

# X-men
Kevin_Bacon.add_actor_to_film(xmen)
Jennifer_Lawrence.add_actor_to_film(xmen)
James_McAvoy.add_actor_to_film(xmen)

# hunger games
Jennifer_Lawrence.add_actor_to_film(hunger)
Josh_Hutcherson.add_actor_to_film(hunger)
Liam_Hemsworth.add_actor_to_film(hunger)

# independence day
Liam_Hemsworth.add_actor_to_film(independence)
Jeff_Goldblum.add_actor_to_film(independence)
Bill_Pullman.add_actor_to_film(independence)

# thor
Jeff_Goldblum.add_actor_to_film(thor)
Cate_Blanchett.add_actor_to_film(thor)
Tessa_Thompson.add_actor_to_film(thor)

# avengers
Scarlett_Johansson.add_actor_to_film(avengers)
Chris_Evans.add_actor_to_film(avengers)
Robert_Downey_Jr.add_actor_to_film(avengers)

Cate_Blanchett.find_kevin_bacon
# prints [Thor: Ragnarok -> Independence Day: Resurgence -> The Hunger Games -> X-Men: First Class]
