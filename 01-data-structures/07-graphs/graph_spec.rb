include RSpec

require_relative 'graph'
RSpec.describe Graph, type: Class do

  let(:movie_graph) { Graph.new() }
  let(:daniel) { "Daniel Radcliff" }
  let(:harris) { "Richard Harris" }
  let(:redgrave) { "Vanessa Redgrave" }
  let(:watson) { "Emma Watson" }
  let(:potter) { "Harry Potter and the Sorceror's Stone" }
  let(:camelot) { "Camelot" }
  let(:beauty) { "Beauty and the Beast" }
  
    before do
        movie_graph.add(daniel, potter)
        movie_graph.add(watson, potter)
        movie_graph.add(harris, potter)
        movie_graph.add(harris, camelot)
        movie_graph.add(redgrave, camelot)
        movie_graph.add(watson, beauty)
    end
    
    describe "#add" do
        it "adds daniel and potter to graph" do
            expect(movie_graph.find(daniel)).to be_truthy
            expect(movie_graph.find(daniel).find(potter)).to be_truthy
            expect(movie_graph.find(daniel).find(potter).length).to eq(2)
        end
    end

end