include RSpec

require_relative 'heap'

RSpec.describe Heap, type: Class do
  let (:root) { Node.new("Indiana Jones and the Last Crusade", 87) }

  let (:tree) { Heap.new(root) }
  let (:gone) { Node.new("Gone In 60 Seconds", 24) }
  let (:ace) { Node.new("Ace Ventura: Pet Detective", 46) }
  let (:die_hard) { Node.new("Die Hard: With A Vengeance", 52) }
  let (:fifth) { Node.new("The Fifth Element", 72) }
  let (:royal) { Node.new("The Royal Tanenbaums", 80) }
  let (:rec) { Node.new("[Rec]", 88) }
  let (:harry) { Node.new("Harry Potter and the Prisoner of Azkaban", 91) }
  let (:looper) { Node.new("Looper", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:roger) { Node.new("Who Framed Roger Rabbit", 96) }
  let (:mad_max) { Node.new("Mad Max: Fury Road", 97) }

  describe "#insert(data)" do
    it "properly inserts a new node as lower value left child" do
      tree.insert(root, rec)
      expect(root.left.title).to eq "[Rec]"
    end

    it "properly inserts a new node as higher value right child" do
      tree.insert(root, harry)
      tree.insert(root, roger)
      expect(root.right.title).to eq "Who Framed Roger Rabbit"
    end

    it "properly inserts a new node as a lower value root" do
      expected_output = "Gone In 60 Seconds: 24\nIndiana Jones and the Last Crusade: 87\nDie Hard: With A Vengeance: 52\n"
      tree.insert(root, die_hard)
      tree.insert(die_hard, gone)
      expect { tree.printf }.to output(expected_output).to_stdout
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(root, roger)
      tree.insert(root, mad_max)
      expect(tree.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(root, rec)
      expect(tree.find(root, rec.title).title).to eq "[Rec]"
    end

    it "properly finds a left-left node" do
      tree.insert(root, ace)
      tree.insert(ace, gone)
      tree.insert(gone, looper)
      expect(tree.find(gone, looper.title).title).to eq "Looper"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(root, empire)
      tree.delete(root, empire.title)
      expect(tree.find(root, empire.title)).to be_nil
    end

    it "properly deletes root node" do
      expected_output = "Ace Ventura: Pet Detective: 46\nIndiana Jones and the Last Crusade: 87\n"
      tree.insert(root, ace)
      tree.insert(ace, gone)
      tree.delete(gone, gone.title)
      expect { tree.printf }.to output(expected_output).to_stdout
    end

    it "properly lowers a replacement node to correct location after deletion" do
      expected_output = "Ace Ventura: Pet Detective: 46\nDie Hard: With A Vengeance: 52\n[Rec]: 88\nIndiana Jones and the Last Crusade: 87\nThe Fifth Element: 72\nWho Framed Roger Rabbit: 96\nLooper: 93\nMad Max: Fury Road: 97\nHarry Potter and the Prisoner of Azkaban: 91\nStar Wars: The Empire Strikes Back: 94\nThe Royal Tanenbaums: 80\n"
      tree.insert(root, empire) #94
      tree.insert(root, roger) #96
      tree.insert(root, mad_max) #97
      tree.insert(root, harry) #91
      tree.insert(root, looper) #93
      tree.insert(root, rec) #88
      tree.insert(root, die_hard) #52
      tree.insert(die_hard, fifth) #72
      tree.insert(die_hard, royal) #80
      tree.insert(die_hard, ace) #46
      tree.insert(ace, gone) #24
      tree.delete(gone, gone.title)
      expect(tree.find(ace, gone.title)).to be_nil
      expect { tree.printf }.to output(expected_output).to_stdout
    end
  end

  describe "#printf" do
     specify {
       expected_output = "Gone In 60 Seconds: 24\nAce Ventura: Pet Detective: 46\nDie Hard: With A Vengeance: 52\nIndiana Jones and the Last Crusade: 87\n[Rec]: 88\nWho Framed Roger Rabbit: 96\nThe Royal Tanenbaums: 80\nStar Wars: The Empire Strikes Back: 94\nHarry Potter and the Prisoner of Azkaban: 91\nLooper: 93\nMad Max: Fury Road: 97\n"
       tree.insert(root, mad_max)#mad
       tree.insert(root, rec)#dsictrit
       tree.insert(root, harry)#shawshank
       tree.insert(root, ace)#brave
       tree.insert(root, royal)#inception
       tree.insert(root, gone)#padific
       tree.insert(root, looper)#martian
       tree.insert(root, die_hard)#jedi
       tree.insert(root, roger)#empire
       tree.insert(root, empire)#hope
       expect { tree.printf }.to output(expected_output).to_stdout
       tree.printf
     }
  end
  
end