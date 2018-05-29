require_relative 'graph_search'


kevin_bacon = Node.new("Kevin Bacon")
lori_singer = Node.new("Lori Singer")
john_lithgow = Node.new("John Lithgow")
dianne_wiest = Node.new("Dianne Wiest")
chris_penn = Node.new("Chris Penn")
sara_jessica_parker = Node.new("Sara_Jessica_Parker")
matthew_mcconaughey = Node.new("Matthew McConaughey")
anne_hathaway = Node.new("Anne Hathaway")
jessica_chastain = Node.new("Jessica Chastain")
helen_hunt = Node.new("Helen Hunt")
zoe_saldanas = Node.new("Zoe Saldanas")
steve_buscemi = Node.new("Steve Buscemi")
harvey_keitel = Node.new("Harvey Keitel")
tim_roth = Node.new("Tim Roth")
bill_paxton = Node.new("Bill Paxton")
tom_hanks = Node.new("Tom Hanks")
jeff_bridges = Node.new("Jeff Bridges")
john_goodman = Node.new("John Goodman")
julianne_moore = Node.new("Julianne Moore")
graph = GraphSearch.new(kevin_bacon)

kevin_bacon.film_actor_hash["FootLoose"] = [lori_singer, john_lithgow, chris_penn, john_goodman]
bill_paxton.film_actor_hash["Appolo 13"] = [kevin_bacon, tom_hanks]
chris_penn.film_actor_hash["Resevoir Dogs"] = [steve_buscemi, harvey_keitel, tim_roth, tom_hanks]
tim_roth.film_actor_hash["Resevoir Dogs"] =  [steve_buscemi, harvey_keitel]
john_lithgow.film_actor_hash["Interstellar"] = [matthew_mcconaughey, anne_hathaway, lori_singer]
steve_buscemi.film_actor_hash["The Big Lebowski"] = [jeff_bridges, john_goodman, julianne_moore]
julianne_moore.film_actor_hash["Crazy Stupid Love"] = [tim_roth, zoe_saldanas]
