include RSpec

require_relative 'node'
require_relative 'kevin_bacon'

RSpec.describe Graph, type: Class do
  let (:graph) {Graph.new}

  let (:kevin_bacon) { Node.new('Kevin Bacon') }
  let (:james_mcavoy) { Node.new('James McAvoy') }
  let (:michael_fassbender) { Node.new('Michael Fassbender') }
  let (:jennifer_lawrence) { Node.new('Jennifer Lawrence') }
  let (:nicholas_hoult) { Node.new('Nicholas Hoult') }
  let (:steve_carell) { Node.new('Steve Carell') }
  let (:ryan_gosling) { Node.new('Ryan Gosling') }
  let (:julianne_moore) { Node.new('Julianne Moore') }
  let (:emma_stone) { Node.new('Emma Stone') }
  let (:morgan_freeman) { Node.new('Morgan Freeman') }
  let (:harrison_ford) { Node.new('Harrison Ford') }
  let (:tommy_lee_jones) { Node.new('Tommy Lee Jones') }
  let (:angelina_jolie) { Node.new('Angelina Jolie') }
  let (:chris_pratt) { Node.new('Chris Pratt') }
  let (:matt_damon) { Node.new('Matt Damon') }
  let (:matthew_mcconaughey) { Node.new('Matthew Mcconaughey') }
  let (:anne_hathaway) { Node.new('Anne Hathaway') }
  let (:zoe_saldana) { Node.new('Zoe Saldana') }
  let (:bradley_cooper) { Node.new('Bradley Cooper') }
  let (:chris_pine) { Node.new('Chris Pine') }
  let (:benedict_cumberbatch) { Node.new('Benedict Cumberbatch') }
  let (:simon_pegg) { Node.new('Simon Pegg') }
  let (:tom_cruise) { Node.new('Tom Cruise') }
  let (:jeremy_renner) { Node.new('Jeremy Renner') }
  let (:amy_adams) { Node.new('Amy Adams') }
  let (:henry_cavill) { Node.new('Henry Cavill') }

  before do
    kevin_bacon.film_actor_hash['X-Men: First Class'] = [james_mcavoy, michael_fassbender, jennifer_lawrence, nicholas_hoult]
    james_mcavoy.film_actor_hash['X-Men: First Class'] = [kevin_bacon, michael_fassbender, jennifer_lawrence, nicholas_hoult]
    michael_fassbender.film_actor_hash['X-Men: First Class'] = [james_mcavoy, kevin_bacon, jennifer_lawrence, nicholas_hoult]
    jennifer_lawrence.film_actor_hash['X-Men: First Class'] = [james_mcavoy, michael_fassbender, kevin_bacon, nicholas_hoult]
    nicholas_hoult.film_actor_hash['X-Men: First Class'] = [james_mcavoy, michael_fassbender, jennifer_lawrence, kevin_bacon]

    kevin_bacon.film_actor_hash['Crazy, Stupid, Love'] = [steve_carell, ryan_gosling, julianne_moore, emma_stone]
    steve_carell.film_actor_hash['Crazy, Stupid, Love'] = [kevin_bacon, ryan_gosling, julianne_moore, emma_stone]
    ryan_gosling.film_actor_hash['Crazy, Stupid, Love'] = [steve_carell, kevin_bacon, julianne_moore, emma_stone]
    julianne_moore.film_actor_hash['Crazy, Stupid, Love'] = [steve_carell, ryan_gosling, steve_carell, emma_stone]
    emma_stone.film_actor_hash['Crazy, Stupid, Love'] = [steve_carell, ryan_gosling, julianne_moore, kevin_bacon]

    ryan_gosling.film_actor_hash['Blade Runner: 2049'] = [harrison_ford]
    harrison_ford.film_actor_hash['Blade Runner: 2049'] =[ryan_gosling]

    harrison_ford.film_actor_hash['The Fugitive'] = [tommy_lee_jones]
    tommy_lee_jones.film_actor_hash['The Fugitive'] = [harrison_ford]

    james_mcavoy.film_actor_hash['Wanted'] = [morgan_freeman, angelina_jolie, chris_pratt]
    morgan_freeman.film_actor_hash['Wanted'] = [james_mcavoy, angelina_jolie, chris_pratt]
    angelina_jolie.film_actor_hash['Wanted'] = [morgan_freeman, james_mcavoy, chris_pratt]
    chris_pratt.film_actor_hash['Wanted'] = [morgan_freeman, angelina_jolie, james_mcavoy]

    chris_pratt.film_actor_hash['Guardians of the Galaxy'] = [zoe_saldana, bradley_cooper]
    zoe_saldana.film_actor_hash['Guardians of the Galaxy'] = [chris_pratt, bradley_cooper]
    bradley_cooper.film_actor_hash['Guardians of the Galaxy'] = [zoe_saldana, chris_pratt]

    zoe_saldana.film_actor_hash['Star Trek: Into Darkness'] = [chris_pine, benedict_cumberbatch, simon_pegg]
    chris_pine.film_actor_hash['Star Trek: Into Darkness'] = [zoe_saldana, benedict_cumberbatch, simon_pegg]
    benedict_cumberbatch.film_actor_hash['Star Trek: Into Darkness'] = [chris_pine, zoe_saldana, simon_pegg]
    simon_pegg.film_actor_hash['Star Trek: Into Darkness'] = [chris_pine, benedict_cumberbatch, zoe_saldana]

    simon_pegg.film_actor_hash['Mission Impossible: Ghost Protocol'] = [tom_cruise, jeremy_renner]
    tom_cruise.film_actor_hash['Mission Impossible: Ghost Protocol'] = [simon_pegg, jeremy_renner]
    jeremy_renner.film_actor_hash['Mission Impossible: Ghost Protocol'] = [simon_pegg, tom_cruise]

    jeremy_renner.film_actor_hash['Arrival'] = [amy_adams]
    amy_adams.film_actor_hash['Arrival'] = [jeremy_renner]

    matt_damon.film_actor_hash['Interstellar'] = [matthew_mcconaughey, anne_hathaway]
    matthew_mcconaughey.film_actor_hash['Interstellar'] = [matt_damon, anne_hathaway]
    anne_hathaway.film_actor_hash['Interstellar'] = [matthew_mcconaughey, matt_damon]
  end

  describe "it finds the actor that was passed" do
    # it "finds Kevin Bacon from himself" do
    #   paths = []
    #   expect(graph.find_kevin_bacon(kevin_bacon)).to eq(paths)
    # end
    #
    # it "finds Kevin Bacon from Michael Fassbender" do
    #   paths = ['X-Men: First Class']
    #   expect(graph.find_kevin_bacon(michael_fassbender)).to eq(paths)
    # end
    #
    # it "finds Kevin Bacon from Morgan Freeman" do
    #   paths = ['Wanted','X-Men: First Class']
    #   expect(graph.find_kevin_bacon(morgan_freeman)).to eq(paths)
    # end
    #
    # it "finds Kevin Bacon from Tommy Lee Jones " do
    #   paths = ['The Fugitive', 'Blade Runner: 2049', 'Crazy, Stupid, Love']
    #   expect(graph.find_kevin_bacon(tommy_lee_jones)).to eq(paths)
    # end

    it "finds Kevin Bacon from Simon Pegg" do
      paths = ['Star Trek: Into Darkness', 'Guardians of the Galaxy', 'Wanted', 'X-Men: First Class']
      expect(graph.find_kevin_bacon(simon_pegg)).to eq(paths)
    end

    # it "finds Kevin Bacon from Tom Cruise" do
    #   paths = ['Mission Impossible: Ghost Protocol', 'Star Trek: Into Darkness', 'Guardians of the Galaxy', 'Wanted', 'X-Men: First Class']
    #   expect(graph.find_kevin_bacon(tom_cruise)).to eq(paths)
    # end
    #
    # it "finds Kevin Bacon from Amy Adams" do
    #   paths = ['Arrival', 'Mission Impossible: Ghost Protocol', 'Star Trek: Into Darkness', 'Guardians of the Galaxy', 'Wanted', 'X-Men: First Class']
    #   expect(graph.find_kevin_bacon(amy_adams)).to eq(paths)
    # end

    # it "does not find Kevin Bacon if more than 6 connections away" do
    #   paths = []
    #   expect(graph.find_kevin_bacon(henry_cavill)).to eq(paths)
    # end
    #
    # it "does not find Kevin Bacon if not connected" do
    #   paths = []
    #   expect(graph.find_kevin_bacon(matt_damon)).to eq(paths)
    # end
  end
end
