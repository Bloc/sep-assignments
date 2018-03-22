include RSpec

require_relative 'node'
require_relative 'kevin_bacon'

RSpec.describe Graph, type: Class do
  let (:graph) {Graph.new}

  let (:kevin_bacon) { Node.new('Kevin Bacon') }
  let (:james_mcavoy) { Node.new('James McAvoy') }
  let (:michael_fassbender) { Node.new('Michael Fassbender') }
  let (:jennifer_lawrence) { Node.new('Jennifer Lawrence') }
  let (:ryan_gosling) { Node.new('Ryan Gosling') }
  let (:emma_stone) { Node.new('Emma Stone') }
  let (:morgan_freeman) { Node.new('Morgan Freeman') }
  let (:harrison_ford) { Node.new('Harrison Ford') }
  let (:tommy_lee_jones) { Node.new('Tommy Lee Jones') }
  let (:chris_pratt) { Node.new('Chris Pratt') }
  let (:matt_damon) { Node.new('Matt Damon') }
  let (:matthew_mcconaughey) { Node.new('Matthew Mcconaughey') }
  let (:anne_hathaway) { Node.new('Anne Hathaway') }
  let (:zoe_saldana) { Node.new('Zoe Saldana') }
  let (:bradley_cooper) { Node.new('Bradley Cooper') }
  let (:chris_pine) { Node.new('Chris Pine') }
  let (:simon_pegg) { Node.new('Simon Pegg') }
  let (:tom_cruise) { Node.new('Tom Cruise') }
  let (:jeremy_renner) { Node.new('Jeremy Renner') }
  let (:amy_adams) { Node.new('Amy Adams') }
  let (:henry_cavill) { Node.new('Henry Cavill') }

  before do
    kevin_bacon.film_actor_hash['X-Men: First Class'] = [james_mcavoy, michael_fassbender, jennifer_lawrence]
    james_mcavoy.film_actor_hash['X-Men: First Class'] = [kevin_bacon, michael_fassbender, jennifer_lawrence]
    michael_fassbender.film_actor_hash['X-Men: First Class'] = [james_mcavoy, kevin_bacon, jennifer_lawrence]
    jennifer_lawrence.film_actor_hash['X-Men: First Class'] = [james_mcavoy, michael_fassbender, kevin_bacon]

    kevin_bacon.film_actor_hash['Crazy, Stupid, Love'] = [ryan_gosling, emma_stone]
    ryan_gosling.film_actor_hash['Crazy, Stupid, Love'] = [kevin_bacon, emma_stone]
    emma_stone.film_actor_hash['Crazy, Stupid, Love'] = [ryan_gosling, kevin_bacon]

    ryan_gosling.film_actor_hash['Blade Runner: 2049'] = [harrison_ford]
    harrison_ford.film_actor_hash['Blade Runner: 2049'] =[ryan_gosling]

    harrison_ford.film_actor_hash['The Fugitive'] = [tommy_lee_jones]
    tommy_lee_jones.film_actor_hash['The Fugitive'] = [harrison_ford]

    james_mcavoy.film_actor_hash['Wanted'] = [morgan_freeman, chris_pratt]
    morgan_freeman.film_actor_hash['Wanted'] = [james_mcavoy, chris_pratt]
    chris_pratt.film_actor_hash['Wanted'] = [morgan_freeman, james_mcavoy]

    chris_pratt.film_actor_hash['Guardians of the Galaxy'] = [zoe_saldana, bradley_cooper]
    zoe_saldana.film_actor_hash['Guardians of the Galaxy'] = [chris_pratt, bradley_cooper]
    bradley_cooper.film_actor_hash['Guardians of the Galaxy'] = [zoe_saldana, chris_pratt]

    zoe_saldana.film_actor_hash['Star Trek: Into Darkness'] = [chris_pine, simon_pegg]
    chris_pine.film_actor_hash['Star Trek: Into Darkness'] = [zoe_saldana, simon_pegg]
    simon_pegg.film_actor_hash['Star Trek: Into Darkness'] = [chris_pine, zoe_saldana]

    simon_pegg.film_actor_hash['Mission Impossible: Ghost Protocol'] = [tom_cruise, jeremy_renner]
    tom_cruise.film_actor_hash['Mission Impossible: Ghost Protocol'] = [simon_pegg, jeremy_renner]
    jeremy_renner.film_actor_hash['Mission Impossible: Ghost Protocol'] = [simon_pegg, tom_cruise]

    jeremy_renner.film_actor_hash['Arrival'] = [amy_adams]
    amy_adams.film_actor_hash['Arrival'] = [jeremy_renner]

    amy_adams.film_actor_hash['Man of Steel'] = [henry_cavill]
    henry_cavill.film_actor_hash['Man of Steel'] = [amy_adams]

    matt_damon.film_actor_hash['Interstellar'] = [matthew_mcconaughey, anne_hathaway]
    matthew_mcconaughey.film_actor_hash['Interstellar'] = [matt_damon, anne_hathaway]
    anne_hathaway.film_actor_hash['Interstellar'] = [matthew_mcconaughey, matt_damon]
  end

  describe "it finds the actor that was passed" do
    it "finds Kevin Bacon from himself" do
      expect(graph.bfs(kevin_bacon, kevin_bacon)).to eq("You want to find Kevin Bacon from Kevin Bacon? What is this insanity?")
    end

    it "finds Kevin Bacon 1 connection away" do
      paths = ['X-Men: First Class']
      expect(graph.bfs(michael_fassbender, kevin_bacon)).to eq(paths)
    end

    it "finds Kevin Bacon 2 connections away" do
      paths = ['Wanted','X-Men: First Class']
      expect(graph.bfs(morgan_freeman, kevin_bacon)).to eq(paths)
    end

    it "finds Kevin Bacon 3 connections away" do
      paths = ['The Fugitive', 'Blade Runner: 2049', 'Crazy, Stupid, Love']
      expect(graph.bfs(tommy_lee_jones, kevin_bacon)).to eq(paths)
    end

    it "finds Kevin Bacon 4 connections away" do
      paths = ['Star Trek: Into Darkness', 'Guardians of the Galaxy', 'Wanted', 'X-Men: First Class']
      expect(graph.bfs(simon_pegg, kevin_bacon)).to eq(paths)
    end

    it "finds Kevin Bacon 5 connections away" do
      paths = ['Mission Impossible: Ghost Protocol', 'Star Trek: Into Darkness', 'Guardians of the Galaxy', 'Wanted', 'X-Men: First Class']
      expect(graph.bfs(tom_cruise, kevin_bacon)).to eq(paths)
    end

    it "finds Kevin Bacon 6 connections away" do
      paths = ['Arrival', 'Mission Impossible: Ghost Protocol', 'Star Trek: Into Darkness', 'Guardians of the Galaxy', 'Wanted', 'X-Men: First Class']
      expect(graph.bfs(amy_adams, kevin_bacon)).to eq(paths)
    end

    it "does not find Kevin Bacon if more than 6 connections away" do
      expect(graph.bfs(henry_cavill, kevin_bacon)).to eq("Kevin Bacon is more than 6 connections away.")
    end

    it "does not find Kevin Bacon if not connected" do
      expect(graph.bfs(matt_damon, kevin_bacon)).to eq("Kevin Bacon not found.")
    end
  end
end
