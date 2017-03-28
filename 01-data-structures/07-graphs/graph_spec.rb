require_relative 'actor_hash'
require_relative 'film_hash'
require_relative 'find_kevin_bacon'

actor_hash = create_actor_hash
fill_film_hash(actor_hash)

print_films("nil", find_kevin_bacon(nil, []))
print_films("Kevin Bacon", find_kevin_bacon(actor_hash["Kevin Bacon"], []))
print_films("Julianne Moore", find_kevin_bacon(actor_hash["Julianne Moore"], []))
print_films("Hailee Steinfield", find_kevin_bacon(actor_hash["Hailee Steinfield"], []))
print_films("Heather Graham", find_kevin_bacon(actor_hash["Heather Graham"], []))

puts ""