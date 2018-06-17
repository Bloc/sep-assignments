include RSpec

require_relative 'min_heap_tree'

RSpec.describe MinHeapTree, type: Class do
    let(:tree) { MinHeapTree.new }

    let (:matrix) { Node.new("The Matrix", 87) }
    let (:pacific_rim) { Node.new("Pacific Rim", 72) }
    let (:braveheart) { Node.new("Braveheart", 78) }
    let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
    let (:donnie) { Node.new("Donnie Darko", 85) }
    let (:inception) { Node.new("Inception", 86) }
    let (:district) { Node.new("District 9", 90) }
    let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
    let (:martian) { Node.new("The Martian", 92) }
    let (:hope) { Node.new("Star Wars: A New Hope", 93) }
    let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
    let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

    describe '#insert(data)' do
        it "properly inserts a new node" do
            tree.insert(matrix)
            expect(tree.items[1].title).to eq "The Matrix"
        end

        it "properly sorts data after inserting" do
            tree.insert(matrix)
            tree.insert(braveheart)
            tree.insert(shawshank)
            tree.insert(martian)
            expect(tree.items[1].title).to eq "Braveheart"
            expect(tree.items[2].title).to eq "The Matrix"
            expect(tree.items[3].title).to eq "The Shawshank Redemption"
            expect(tree.items[4].title).to eq "The Martian"
        end
    end

    describe '#find(data)' do
        it "handles nil gracefully" do
            tree.insert(matrix)
            tree.insert(mad_max_2)
            expect(tree.find(nil)).to eq nil
        end

        it "properly finds the correct node" do
            tree.insert(empire)
            tree.insert(hope)
            tree.insert(donnie)
            tree.insert(inception)
            expect(tree.find(donnie.title).title).to eq "Donnie Darko"
        end
    end

    describe '#delete(data)' do
        it "handles nil gracefully" do
            expect(tree.delete(nil)).to eq nil
        end

        it "properly deletes the correct node" do
            tree.insert(matrix)
            tree.insert(braveheart)
            tree.insert(martian)
            tree.insert(donnie)
            tree.delete(braveheart.title)
            expect(tree.find(braveheart.title)).to be_nil
        end

        it "properly resorts after delete" do
            tree.insert(matrix)
            tree.insert(braveheart)
            tree.insert(shawshank)
            tree.insert(martian)
            tree.delete(matrix.title)
            expect(tree.items[1].title).to eq "Braveheart"
            expect(tree.items[2].title).to eq "The Martian"
            expect(tree.items[3].title).to eq "The Shawshank Redemption"
        end
    end

    describe "#print_heap" do
        specify {
            expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nThe Matrix: 87\nDistrict 9: 90\nStar Wars: The Empire Strikes Back: 94\nInception: 86\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nThe Martian: 92\nMad Max 2: The Road Warrior: 98\n"
            tree.insert(matrix)
            tree.insert(hope)
            tree.insert(empire)
            tree.insert(jedi)
            tree.insert(martian)
            tree.insert(pacific_rim)
            tree.insert(inception)
            tree.insert(braveheart)
            tree.insert(shawshank)
            tree.insert(district)
            tree.insert(mad_max_2)
            expect { tree.print_heap }.to output(expected_output).to_stdout
        }
    end
end