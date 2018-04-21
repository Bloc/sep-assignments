include RSpec

require_relative 'graph'

RSpec.describe Graph, type: Class do
  let (:graph) {Graph.new}
  let (:kevin_bacon) {Node.new("Kevin Bacon")}
  let (:tom_hanks) { Node.new("Tom Hanks") }
  let (:paul_giamatti) { Node.new("Paul Giamatti") }
  let (:al_pacino) {Node.new("Al Pacino")}
  let (:alec_baldwin) { Node.new("Alec Baldwin") }
  let (:bean) { Node.new("Mr. Bean") }
  let (:leonardo) { Node.new("Leonardo DiCapprio") }
  let (:clare_danes) { Node.new("Clare Danes") }
  let (:damien_lewis) {Node.new("Damien Lewis")}

  before (:each) do
    kevin_bacon.film_actor_hash["Random_Movie"] = [tom_hanks]
    
    damien_lewis.film_actor_hash["Homeland"] = [clare_danes]
    clare_danes.film_actor_hash["Romeo & Juliet"] = [leonardo]
    leonardo.film_actor_hash["Catch Me If You Can"] = [tom_hanks]
    tom_hanks.film_actor_hash["Saving Private Ryan"] = [paul_giamatti]
    paul_giamatti.film_actor_hash["Donnie Brasco"] = [al_pacino]
    al_pacino.film_actor_hash["Glengarry Glen Ross"] = [alec_baldwin]
    alec_baldwin.film_actor_hash["She's Having a Baby"] = [kevin_bacon]
  end

  describe "#find_kevin_bacon(node)" do
    it "returns an error if node name is Kevin Bacon" do
      result = graph.find_kevin_bacon(kevin_bacon)
      expect(result).to eq "I guess, technically, Kevin Bacon is 0 degrees seperated from from Kevin Bacon"
    end

    it "if @result is larger than 6 degrees, it returns an error message conveying so" do
      result = graph.find_kevin_bacon(damien_lewis)
      expect(result).to eq "Damien Lewis is more than 6 degrees from Kevin Bacon."
    end

    it "if we have made a link to Kevin Bacon within 6 degrees, it returns a valid result" do
      result = graph.find_kevin_bacon(tom_hanks)
      expect(result).to eq ["Saving Private Ryan", "Donnie Brasco", "Glengarry Glen Ross", "She's Having a Baby"]
    end
  end
end