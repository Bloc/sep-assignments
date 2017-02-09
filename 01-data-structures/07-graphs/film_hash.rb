def fill_film_hash(actor_hash)
	film_hash = Hash.new
	film_hash["Apollo 13"] = [ "Kevin Bacon", "Tom Hanks", "Bill Paxton", "Gary Sinise" ]
	film_hash["Boogie Nights"] = [ "Julianne Moore", "Mark Wahlberg", "Burt Reynolds", "Heather Graham" ]
	film_hash["Edge of Tomorrow"] = [ "Tom Cruise", "Emily Blunt", "Bill Paxton", "Brenden Gleeson" ]
	film_hash["Flatliners"] = [ "Kevin Bacon", "Kiefer Sutherland", "Julia Roberts", "William Baldwin" ]
	film_hash["Footloose"] = [ "Kevin Bacon", "Lori Singer", "Dianne West", "John Lithgow" ]
	film_hash["Guardians of the Galaxy"] = [ "Benicio Del Toro", "Chris Pratt", "Zoe Saldana", "Dave Bautista" ]
	film_hash["Iron Man"] = [ "Jeff Bridges", "Robert Downey Jr", "Terrence Howard", "Gwyneth Paltrow" ]
	film_hash["Jurassic Park: The Lost World"] = [ "Julianne Moore", "Jeff Goldblum", "Pete Postlethwaite", "Arliss Howard" ]
	film_hash["Jurassic World"] = [ "Chris Pratt", "Bryce Dallas Howard", "Vincent D'Onofio", "Ty Simpkins" ]
	film_hash["Lego Movie"] = [ "Chris Pratt", "Will Ferrell", "Elizabeth Banks", "Will Arnett" ]
	film_hash["Magnolia"] = [ "Julianne Moore", "Tom Cruise", "William H Macy", "Philip Seymour Hoffman" ]
	film_hash["Mission: Impossible - Rogue Nation"] = [ "Tom Cruise", "Jeremy Renner", "Simon Pegg", "Rebecca Ferguson" ]
	film_hash["Moneyball"] = [ "Chris Pratt", "Brad Pitt", "Jonah Hill", "Philip Seymour Hoffman" ]
	film_hash["Oblivion"] = [ "Tom Cruise", "Morgan Freeman", "Olga Kurylenko", "Melissa Leo" ]
	film_hash["RIPD"] = [ "Kevin Bacon", "Jeff Bridges", "Ryan Reynolds", "Mary-Louise Parker" ]
	film_hash["Savages"] = [ "Benicio Del Toro", "Taylor Kitsch", "Blake Lively", "John Travolta" ]
	film_hash["Sicario"] = [ "Emily Blunt", "Benicio Del Toro", "Josh Brolin" ]
	film_hash["The Big Lebowski"] = [ "Jeff Bridges", "John Goodman", "Julianne Moore", "Steve Buscemi" ]
	film_hash["The Devil Wears Prada"] = [ "Emily Blunt", "Anne Hathaway", "Meryl Streep", "Stanley Tucci" ]
	film_hash["The Girl on the Train"] = [ "Emily Blunt", "Rebecca Ferguson", "Haley Bennett", "Juston Theroux" ]
	film_hash["The Way of the Gun"] = [ "Benicio Del Toro", "Ryan Phillippe", "Juliette Lewis", "Taye Diggs" ]
	film_hash["True Grit"] = [ "Jeff Bridges", "Matt Damon", "Josh Brolin", "Hailee Steinfield" ]

	film_hash.each { |film, actors| 
		# puts "#{film} #{actors}"
		actors.each { |actor| actor_hash[actor].film_actor_hash[film] = [] }
	}

	actor_hash.each { |key, actor|
		# puts "#{actor.name}"
		actor.film_actor_hash.each { |film, actors|
			# puts "- #{film}"
			film_hash[film].each { |n| 
				if n != actor.name 
					# puts "-- n:#{n}"
					actor.film_actor_hash[film].push(actor_hash[n])
				end
			}
		}
	}

end

