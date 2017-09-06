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
  let(:bacon) { "Kevin Bacon" }
  let(:diner) {"Diner" }
  let(:rourke) {"Mickey Rourke"}
  let(:iron_man_two) {"Iron Man 2"}
  let(:downey) {"Robert Downey"}
  let(:holmes) {"Sherlock Holmes" }
  let(:law) {"Jude Law"}
  let(:hugo) {"Hugo" }
  let(:moretz) {"Chloe Moretz"}
  let(:shadows) {"Dark Shadows"}
  let(:depp) {"Johnny Depp"}
  let(:scissorhands) {"Edward Scissorhands"}
  let(:price) {"Vincent Price" }
  let(:web) {"The Web" }
  let(:bendix) {"William Bendix"}
  
    before do
        movie_graph.add(daniel, potter)
        movie_graph.add(watson, potter)
        movie_graph.add(harris, potter)
        movie_graph.add(harris, camelot)
        movie_graph.add(redgrave, camelot)
        movie_graph.add(watson, beauty)
        movie_graph.add(bacon, diner)
        movie_graph.add(rourke, diner)
        movie_graph.add(rourke, iron_man_two)
        movie_graph.add(downey, iron_man_two)
        movie_graph.add(downey, holmes)
        movie_graph.add(law, holmes)
        movie_graph.add(law, hugo)
        movie_graph.add(moretz, hugo)
        movie_graph.add(moretz, shadows)
        movie_graph.add(depp, shadows)
        movie_graph.add(depp, scissorhands)
        movie_graph.add(price, scissorhands)
        movie_graph.add(price, web)
        movie_graph.add(bendix, web)
        

    end
    
    describe "#add" do
        it "adds daniel and potter to graph" do
            expect(movie_graph.find(daniel)).to be_truthy
            expect(movie_graph.find(daniel).find(potter)).to be_truthy
            expect(movie_graph.find(daniel).find(potter).length).to eq(2)
        end
    end
    
    describe "#find_path" do
        it "finds the shortest path between two actors" do
            movie_graph.set_indices()
            d_node = movie_graph.find(daniel)
            r_node = movie_graph.find(redgrave)
            start_index = d_node.index
            end_index = r_node.index
            path = movie_graph.find_path(start_index, end_index)
            even = true
            #path.each do |node|
            #    if even
            #        puts(node.name)
            #        even = false
            #    else
            #        puts("[#{node}]")
            #        even = true
            #    end
            #end
            expect(path.length).to eq(5)
            expect(path[0].name).to eq(daniel)
            expect(path[1]).to eq(potter)
            expect(path[2].name).to eq(harris)
            expect(path[3]).to eq(camelot)
            expect(path[4].name).to eq(redgrave)
        end
    end
    
    describe "#path_to_kevin_bacon" do
       it "finds the path to kevin bacon" do
            movie_graph.set_indices()
            path = movie_graph.path_to_kevin_bacon(bacon)
           
            expect(path.length).to eq(1)
           
            path = movie_graph.path_to_kevin_bacon(law)
            expect(path.length).to eq(7)
            puts("=====kevin bacon to jude law===")
            even = true
            path.each do |node|
                if even
                    puts(node.name)
                    even = false
                else
                    puts("[#{node}]")
                    even = true
                end
            end
            
            path = movie_graph.path_to_kevin_bacon(price)
            expect(path.length).to eq(13)
            puts("=====kevin bacon to vincent price===")

            even = true
            path.each do |node|
                if even
                    puts(node.name)
                    even = false
                else
                    puts("[#{node}]")
                    even = true
                end
            end
            
            path = movie_graph.path_to_kevin_bacon(bendix)
            expect(path).to be_nil
        end
    end 
end