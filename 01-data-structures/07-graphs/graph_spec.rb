include RSpec

require_relative 'graph'

RSpec.describe Graph, type: Class do
  let (:kevin_bacon) { Node.new("Kevin Bacon") }

  let (:tom_hanks) { Node.new("Tom Hanks") }
  let (:bill_paxton) { Node.new("Bill Paxton") }
  let (:gary_sinise) { Node.new("Gary Sinise") }
  let (:lori_singer) { Node.new("Lori Singer") }
  let (:dianne_wiest) { Node.new("Dianne Wiest") }
  let (:john_lithgow) { Node.new("John Lithgow") }
  let (:elizabeth_perkins) { Node.new("elizabeth_perkins") }
  let (:robert_loggia) { Node.new("Robert Loggia") }
  let (:john_heard) { Node.new("John Heard") }
  let (:helen_hunt) { Node.new("Helen Hunt") }
  let (:jami_gertz) { Node.new("Jami Gertz") }
  let (:cary_elwes) { Node.new("Cary Elwes") }
  let (:mike_meyers) { Node.new("Mike Meyers") }
  let (:eddie_murphy) { Node.new("Eddie Murphy") }
  let (:melissa_mccarthy) { Node.new("Melissa McCarthy") }
  let (:al_pachino) { Node.new("Al Pachino") }

  let (:graph) { Graph.new(:kevin_bacon) }

  describe "#add(movie, actors)" do
    it "properly adds an array of nodes to an actor" do
      kevin_bacon.add("Apollo 13", [tom_hanks, bill_paxton, gary_sinise])
      kevin_bacon.add("Footloose", [lori_singer, dianne_wiest, john_lithgow])
      expect(kevin_bacon.film_actor_hash["Apollo 13"]).not_to be_empty
    end
  end

  describe "set_bacon_number" do
    before do
      kevin_bacon.add("Apollo 13", [tom_hanks, bill_paxton, gary_sinise])
      kevin_bacon.add("Footloose", [lori_singer, dianne_wiest, john_lithgow])
      tom_hanks.add("Apollo 13", [kevin_bacon, bill_paxton, gary_sinise])
      tom_hanks.add("Big", [elizabeth_perkins, robert_loggia, john_heard])
      elizabeth_perkins.add("Big", [tom_hanks, robert_loggia, john_heard])
      elizabeth_perkins.add("Ghostbusters", [melissa_mccarthy])
      melissa_mccarthy.add("Ghostbusters", [elizabeth_perkins])
    end

    it "properly sets Kevin Bacon's bacon_number to 0" do
      graph.set_bacon_number(kevin_bacon)
      expect(kevin_bacon.bacon_number).to eq 0
    end

    it "properly sets Tom Hanks' bacon_number to 1" do
      graph.set_bacon_number(kevin_bacon)
      expect(tom_hanks.bacon_number).to eq 1
    end

    it "properly sets Elizabeth Perkins' bacon_number to 2" do
      graph.set_bacon_number(kevin_bacon)
      expect(elizabeth_perkins.bacon_number).to eq 2
    end

    it "properly sets Melissa McCarthy's bacon_number to 3" do
      graph.set_bacon_number(kevin_bacon)
      expect(melissa_mccarthy.bacon_number).to eq 3
    end
  end

  describe "find_kevin_bacon" do
    before do
      kevin_bacon.add("Apollo 13", [tom_hanks, bill_paxton, gary_sinise])
      kevin_bacon.add("Footloose", [lori_singer, dianne_wiest, john_lithgow])
      tom_hanks.add("Apollo 13", [kevin_bacon, bill_paxton, gary_sinise])
      tom_hanks.add("Big", [elizabeth_perkins, robert_loggia, john_heard])
      elizabeth_perkins.add("Big", [tom_hanks, robert_loggia, john_heard])
      elizabeth_perkins.add("Ghostbusters", [melissa_mccarthy])
      melissa_mccarthy.add("Ghostbusters", [elizabeth_perkins])
    end

    specify {
      expect{graph.find_kevin_bacon(tom_hanks, kevin_bacon)}.to output("Apollo 13\n").to_stdout
    }

    specify {
      expect{graph.find_kevin_bacon(elizabeth_perkins, kevin_bacon)}.to output("Big\nApollo 13\n").to_stdout
    }

    specify {
      expect{graph.find_kevin_bacon(melissa_mccarthy, kevin_bacon)}.to output("Ghostbusters\nBig\nApollo 13\n").to_stdout
    }
  end
end
