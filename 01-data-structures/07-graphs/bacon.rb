require_relative 'node'


def find_kevin_bacon(actor)
  films = []

  actor.film_actor_hash.each do |title, actors|
    actors.each do |actor|
      if actor != 'kevin_bacon'
        films << title
        find_kevin_bacon(actor)
      else
        if films.length <= 6
          puts "Degrees of Kevin Bacon: #{films.length}"
        else
          puts "More than six degrees of Kevin Bacon"
        end
      end
    end
  end
end


kevin_bacon = Node.new("Kevin Bacon")
kevin_bacon.film_actor_hash = {
  # "Apollo 13": [tom_hanks, bill_paxton, ed_harris], 
  # "Mystic River": [sean_penn, tim_robbins, laurence_fishburne]
}

john_c_reilly = Node.new("John C. Reilly")
john_c_reilly.film_actor_hash = {
  # "Talladega Nights": [sacha_baron_cohen, gary_cole, leslie_bibb],
  # "The River Wild": [meryl_streep, benjamin_bratt, kevin_bacon]
  "The River Wild" => [kevin_bacon]
}

will_ferrell = Node.new("Will Ferrell")
will_ferrell.film_actor_hash = {
  # "Anchorman": [christina_applegate, paul_rudd, steve_carell],
  # "Step Brothers": [john_c_reilly, adam_scott, richard_jenkins]
  "Step Brothers" => [john_c_reilly]
}

ben_stiller = Node.new("Ben Stiller")
ben_stiller.film_actor_hash = {
  # "Dodgeball": [vince_vaughn, christine_taylor, justin_long],
  # "Zoolander": [owen_wilson, will_ferrell, milla_jovovich]
  "Zoolander" => [will_ferrell]
}

danny_mcbride = Node.new("Danny McBride")
danny_mcbride.film_actor_hash = {
  # "Hot Rod": [andy_samberg, bill_hader, will_arnett],
  # "Tropic Thunder": [ben_stiller, jack_black, robert_downey_jr]
  "Tropic Thunder" => [ben_stiller]
}

james_franco = Node.new("James Franco")
james_franco.film_actor_hash = {
  # "This is the End": [jonah_hill, jay_baruchel, michael_cera],
  # "Pineapple Express": [seth_rogan, danny_mcbride, craig_robinson]
  "Pineapple Express" => [danny_mcbride]
}

tobey_maguire = Node.new("Tobey Maguire")
tobey_maguire.film_actor_hash = {
  # "Spiderman": [kirsten_dunst, james_franco, willem_dafoe],
  # "The Great Gatsby": [leonardo_dicaprio, carey_mulligan, isla_fisher]
  "Spiderman" => [james_franco]
}

johnny_depp = Node.new("Johnny Depp")
johnny_depp.film_actor_hash = {
  # "Pirates of the Carribean": [geoffrey_rush, orlando_bloom, keira_knightley],
  # "Fear and Loathing in Las Vegas": [benicio_del_toro, tobey_maguire, cameron_diaz]
  "Fear and Loathing in Las Vegas" => [tobey_maguire]
}


find_kevin_bacon(james_franco)
