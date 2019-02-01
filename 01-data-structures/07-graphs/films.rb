irb
puts "hello"

require_relative 'BaconFinder'
my_baconFinder = BaconFinder.new()

Kevin_Bacon = Node.new("Kevin Bacon")
Lori_Singer = Node.new("Lori Singer")
John_Lithgow = Node.new("John Lithgow")
Dianne_Wiest = Node.new("Dianne Wiest")
Chris_Penn = Node.new("Chris Penn")
Sarah_Jessica_Parker = Node.new("Sarah Jessica Parker")
Zoe_Saldanas = Node.new("Zoe Saldanas")
Helen_Hunt = Node.new("Helen Hunt")
Matthew_Perry = Node.new("Matthew Perry")
Jessie_Williams = Node.new("Jessie Williams")
David_Schwimmer = Node.new("David Schwimmer")
Patrick_Swazey = Node.new("Patrick Swazey")
Ellen_Pompeo = Node.new("Ellen Pompeo")
Justin_Baldoni = Node.new("Justin Baldoni")
Sandra_Oh = Node.new("Sandra Oh")
Chris_Pratt = Node.new("Chris Pratt")
Bryan_Cranston = Node.new("Bryan Cranston")
Gina_Rodriguez = Node.new("Gina Rodriguez")
Matthew_McConaughey = Node.new("Matthew McConaughey")
Jeff_Perry = Node.new("Jeff Perry")
Viola_Davis = Node.new("Viola Davis")
Kerry_Washington = Node.new("Kerry Washington")
Aaron_Paul = Node.new("Aaron Paul")
Harrison_Ford = Node.new("Harrison Ford")
Woody_Harrelson = Node.new("Woody Harrelson")

Kevin_Bacon.film_actor_hash['Footloose'] = [Lori_Singer, John_Lithgow,
  Dianne_Wiest, Chris_Penn, Sarah_Jessica_Parker]

Kevin_Bacon.film_actor_hash['A'] = [Zoe_Saldanas, Helen_Hunt, Lori_Singer]

Lori_Singer.film_actor_hash['A'] = [Kevin_Bacon, Zoe_Saldanas, Helen_Hunt]

Zoe_Saldanas.film_actor_hash['A'] = [Kevin_Bacon, Lori_Singer, Helen_Hunt]

Helen_Hunt.film_actor_hash['A'] = [Kevin_Bacon, Zoe_Saldanas, Lori_Singer]

Kevin_Bacon.film_actor_hash['B'] = [Matthew_Perry, Jessie_Williams, Lori_Singer]

Lori_Singer.film_actor_hash['B'] = [Matthew_Perry, Jessie_Williams, Kevin_Bacon]

Matthew_Perry.film_actor_hash['B'] = [Jessie_Williams, Lori_Singer, Kevin_Bacon]

Jessie_Williams.film_actor_hash['B'] = [Matthew_Perry, Lori_Singer, Kevin_Bacon]

David_Schwimmer.film_actor_hash['C'] = [Patrick_Swazey, Ellen_Pompeo]

Patrick_Swazey.film_actor_hash['C'] = [David_Schwimmer, Ellen_Pompeo]

Ellen_Pompeo.film_actor_hash['C'] = [David_Schwimmer, Patrick_Swazey]

Matthew_Perry.film_actor_hash['D'] = [Chris_Pratt, Justin_Baldoni, Sandra_Oh]

Chris_Pratt.film_actor_hash['D'] = [Matthew_Perry, Justin_Baldoni, Sandra_Oh]

Justin_Baldoni.film_actor_hash['D'] = [Matthew_Perry, Chris_Pratt, Sandra_Oh]

Sandra_Oh.film_actor_hash['D'] = [Matthew_Perry, Chris_Pratt, Justin_Baldoni]

Sandra_Oh.film_actor_hash['E'] = [Gina_Rodriguez, Bryan_Cranston, Matthew_McConaughey]

Gina_Rodriguez.film_actor_hash['E'] = [Sandra_Oh, Bryan_Cranston, Matthew_McConaughey]

Bryan_Cranston.film_actor_hash['E'] = [Sandra_Oh, Gina_Rodriguez, Matthew_McConaughey]

Matthew_McConaughey.film_actor_hash['E'] = [Sandra_Oh, Gina_Rodriguez, Bryan_Cranston]

Matthew_McConaughey.film_actor_hash['F'] = [Viola_Davis, Jeff_Perry, Kerry_Washington]

Viola_Davis.film_actor_hash['F'] = [Matthew_McConaughey, Jeff_Perry, Kerry_Washington]

Jeff_Perry.film_actor_hash['F'] = [Matthew_McConaughey, Viola_Davis, Kerry_Washington]

Kerry_Washington.film_actor_hash['F'] = [Matthew_McConaughey, Viola_Davis, Jeff_Perry]

Kerry_Washington.film_actor_hash['G'] = [Harrison_Ford, Woody_Harrelson, Aaron_Paul]

Harrison_Ford.film_actor_hash['G'] = [Kerry_Washington, Woody_Harrelson, Aaron_Paul]

Woody_Harrelson.film_actor_hash['G'] = [Kerry_Washington, Harrison_Ford, Aaron_Paul]

Aaron_Paul.film_actor_hash['G'] = [Kerry_Washington, Harrison_Ford, Woody_Harrelson]

result = my_baconFinder.find_kevin_bacon(Harrison_Ford)
puts result
