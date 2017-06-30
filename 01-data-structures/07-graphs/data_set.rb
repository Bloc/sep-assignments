module DataSet
    # attr_accessor :reel, :players

    def self.films
        @films = {}
            @films["Apollo 13"] = [ "Kevin Bacon", "Tom Hanks", "Bill Paxton", "Gary Sinise" ]
            @films["Boogie Nights"] = [ "Julianne Moore", "Mark Wahlberg", "Burt Reynolds", "Heather Graham" ]
            @films["Black Mass"] = [ "Kevin Bacon", "Johnny Depp", "Joel Edgerton", "Benedict Cumberbatch" ]
            @films["Edge of Tomorrow"] = [ "Tom Cruise", "Emily Blunt", "Bill Paxton", "Brenden Gleeson" ]
            @films["Flatliners"] = [ "Kevin Bacon", "Kiefer Sutherland", "Julia Roberts", "William Baldwin" ]
            @films["Footloose"] = [ "Kevin Bacon", "Lori Singer", "Dianne West", "John Lithgow" ]
            @films["Guardians of the Galaxy"] = [ "Benicio Del Toro", "Chris Pratt", "Zoe Saldana", "Dave Bautista" ]
            @films["Iron Man"] = [ "Jeff Bridges", "Robert Downey Jr", "Terrence Howard", "Gwyneth Paltrow"]
            @films["Interstellar"] = ["Matthew McConaughey", "John Lithgow", "Anne Hathaway"]
            @films["Jurassic Park: The Lost World"] = [ "Julianne Moore", "Jeff Goldblum", "Pete Postlethwaite", "Arliss Howard" ]
            @films["Jurassic World"] = [ "Chris Pratt", "Bryce Dallas Howard", "Vincent D'Onofio", "Ty Simpkins" ]
            @films["Lego Movie"] = [ "Chris Pratt", "Will Ferrell", "Elizabeth Banks", "Will Arnett"]
            @films["Magnolia"] = [ "Julianne Moore", "Tom Cruise", "William H Macy", "Philip Seymour Hoffman" ]
            @films["Mission: Impossible - Rogue Nation"] = [ "Tom Cruise", "Jeremy Renner", "Simon Pegg", "Rebecca Ferguson" ]
            @films["Moneyball"] = [ "Chris Pratt", "Brad Pitt", "Jonah Hill", "Philip Seymour Hoffman" ]
            @films["Oblivion"] = [ "Tom Cruise", "Morgan Freeman", "Olga Kurylenko", "Melissa Leo" ]
            @films["RIPD"] = [ "Kevin Bacon", "Jeff Bridges", "Ryan Reynolds", "Mary-Louise Parker" ]
            @films["Savages"] = [ "Benicio Del Toro", "Taylor Kitsch", "Blake Lively", "John Travolta" ]
            @films["Sicario"] = [ "Emily Blunt", "Benicio Del Toro", "Josh Brolin" ]
            @films["The Big Lebowski"] = [ "Jeff Bridges", "John Goodman", "Julianne Moore", "Steve Buscemi", "Philip Seymour Hoffman" ]
            @films["The Devil Wears Prada"] = [ "Emily Blunt", "Anne Hathaway", "Meryl Streep", "Stanley Tucci" ]
            @films["The Girl on the Train"] = [ "Emily Blunt", "Rebecca Ferguson", "Haley Bennett", "Juston Theroux" ]
            @films["The Way of the Gun"] = [ "Benicio Del Toro", "Ryan Phillippe", "Juliette Lewis", "Taye Diggs" ]
            @films["True Grit"] = [ "Jeff Bridges", "Matt Damon", "Josh Brolin", "Hailee Steinfield" ]
            @films["Wolf of Wallstreet"] = ["Leonardo DiCaprio", "Jonah Hill", "Margot Robbie", "Matthew McConaughey" ]

    end

    def self.populate
        self.films
        @reel = {}
        @players = {}
        @films.each_pair do |film, cast|
            @reel[film] = Film.new(film, @reel.length)
            cast.each do |c|
                @players[c] = Actor.new(c, @players.length) unless @players.include? c
                @reel[film].add(@players[c])
                @players[c].add(@reel[film])
            end
        end
    end

    def self.reel
        @reel
    end

    def self.players
        @players
    end
end