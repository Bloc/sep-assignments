require_relative 'node'

def create_actor_hash
	actor_array = [
		"Anne Hathaway", 
		"Arliss Howard", 
		"Benicio Del Toro", 
		"Bill Paxton", 
		"Blake Lively", 
		"Brad Pitt", 
		"Brenden Gleeson", 
		"Bryce Dallas Howard", 
		"Burt Reynolds", 
		"Chris Pratt", 
		"Dave Bautista", 
		"Dianne West", 
		"Elizabeth Banks", 
		"Emily Blunt", 
		"Gary Sinise", 
		"Gwyneth Paltrow", 
		"Hailee Steinfield", 
		"Haley Bennett", 
		"Heather Graham", 
		"Jeff Bridges", 
		"Jeff Goldblum", 
		"Jeremy Renner", 
		"John Goodman", 
		"John Lithgow", 
		"John Travolta", 
		"Jonah Hill", 
		"Josh Brolin", 
		"Julia Roberts", 
		"Julianne Moore", 
		"Juliette Lewis", 
		"Juston Theroux", 
		"Kevin Bacon", 
		"Kiefer Sutherland", 
		"Lori Singer", 
		"Mark Wahlberg", 
		"Mary-Louise Parker", 
		"Matt Damon", 
		"Melissa Leo", 
		"Meryl Streep", 
		"Morgan Freeman", 
		"Olga Kurylenko", 
		"Pete Postlethwaite", 
		"Philip Seymour Hoffman", 
		"Rebecca Ferguson", 
		"Robert Downey Jr", 
		"Ryan Phillippe", 
		"Ryan Reynolds", 
		"Simon Pegg", 
		"Stanley Tucci", 
		"Steve Buscemi", 
		"Taye Diggs", 
		"Taylor Kitsch", 
		"Terrence Howard", 
		"Tom Cruise", 
		"Tom Hanks", 
		"Ty Simpkins", 
		"Vincent D'Onofio", 
		"Will Arnett", 
		"Will Ferrell", 
		"William Baldwin", 
		"William H Macy", 
		"Zoe Saldana"
	]

	actor_hash = Hash.new
	actor_array.each do |n| 
		if actor_hash[n].nil? 
			actor_hash[n] = Node.new(n) 
			actor_hash[n].film_actor_hash = Hash.new
		end
	end
	return actor_hash 
end







