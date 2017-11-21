include RSpec

require_relative 'graph_search'

RSpec.describe GraphSearch, type: Class do


  let (:kevin_bacon) { Node.new("Kevin Bacon") }
  let (:lori_singer) { Node.new("Lori Singer") }
  let (:john_lithgow) { Node.new("John Lithgow") }
  let (:dianne_wiest) { Node.new("Dianne Wiest") }
  let (:chris_penn)   { Node.new("Chris Penn") }
  let (:sara_jessica_parker)  { Node.new("Sara Jessica Parker") }
  let (:matthew_mcconaughey) { Node.new("Matthew McConaughey") }
  let (:anne_hathaway) { Node.new("Anne Hathaway") }
  let (:jessica_chastain) { Node.new("Jessica Chastain") }
  let (:helen_hunt)  { Node.new("Helen Hunt") }
  let (:zoe_saldanas)  { Node.new("Zoe Saldanas") }
  let (:steve_buscemi)  { Node.new("Steve Buscemi") }
  let (:harvey_keitel)   { Node.new("Harvey Keitel") }
  let (:tim_roth) { Node.new("Tim Roth") }
  let (:bill_paxton) { Node.new("Bill Paxton") }
  let (:tom_hanks) { Node.new("Tom Hanks") }
  let (:jeff_bridges) { Node.new("Jeff Bridges") }
  let (:john_goodman) { Node.new("John Goodman") }
  let (:julianne_moore) { Node.new("Julianne Moore") }



  let (:graph) {GraphSearch.new(kevin_bacon)}

  before (:each) do
    kevin_bacon.film_actor_hash["FootLoose"] = [lori_singer, john_lithgow, chris_penn, john_goodman]
    bill_paxton.film_actor_hash["Appolo 13"] = [kevin_bacon, tom_hanks]
    chris_penn.film_actor_hash["Resevoir Dogs"] = [steve_buscemi, harvey_keitel, tim_roth, tom_hanks]
    john_lithgow.film_actor_hash["Interstellar"] = [matthew_mcconaughey, anne_hathaway, lori_singer]
    steve_buscemi.film_actor_hash["The Big Lebowski"] = [jeff_bridges, john_goodman, julianne_moore]
    julianne_moore.film_actor_hash["Crazy Stupid Love"] = [tim_roth, zoe_saldanas]
    

  end


  describe "testing the node" do
    it "test node to read property" do
      expect(kevin_bacon.name).to eq("Kevin Bacon")
    end

    it "properly reads the hash info" do
      expect(kevin_bacon.film_actor_hash["FootLoose"][0].name).to eq ("Lori Singer")
    end
  end

  describe "#find_kevin_bacon" do
    it "fails gracefully if node doesn't exist" do
      expect(graph.find_kevin_bacon(matthew_mcconaughey)).to be_nil
    end

    it "fails gracefully if there a no movie nodes or actor not associated" do
      expect(graph.find_kevin_bacon(dianne_wiest)).to be_nil
    end


    it "finds kevin back if he is in a movie - one degree" do
      expect{(graph.find_kevin_bacon(bill_paxton))}.to output("[\"Appolo 13\"]\n").to_stdout
    end

    it "finds kevin if he knows a co-actor that was in one of his movies" do
      expect{(graph.find_kevin_bacon(lori_singer))}.to output("[\"FootLoose\"]\n").to_stdout
    end

    it "finds kevin if he is associated with an actor in another film steve_buscemi => john_goodman => kevin_bacon" do
      expect{(graph.find_kevin_bacon(steve_buscemi))}.to output("[\"The Big Lebowski\", \"FootLoose\"]\n").to_stdout
    end
  end


end
