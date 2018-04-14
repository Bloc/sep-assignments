include RSpec

require_relative 'binary_search_tree'

RSpec.describe BinarySearchTree, type: Class do
  let (:root) { Node.new("Indiana Jones and the Last Crusade", 87) }

  let (:tree) { BinarySearchTree.new(root) }
  let (:gone) { Node.new("Gone In 60 Seconds", 24) }
  let (:ace) { Node.new("Ace Ventura: Pet Detective", 46) }
  let (:die_hard) { Node.new("Die Hard: With A Vengeance", 52) }
  let (:fifth) { Node.new("The Fifth Element", 72) }
  let (:royal) { Node.new("The Royal Tanenbaums", 80) }
  let (:rec) { Node.new("[REC]", 88) }
  let (:harry) { Node.new("Harry Potter and the Prisoner of Azkaban", 91) }
  let (:looper) { Node.new("Looper", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:roger) { Node.new("Who Framed Roger Rabbit", 96) }
  let (:mad_max) { Node.new("Mad Max: Fury Road", 97) }

  describe "#insert(data)" do
    it "properly inserts a new node as a left child" do
      tree.insert(root, gone)
      expect(root.left.title).to eq "Gone In 60 Seconds"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(root, ace)
      tree.insert(root, gone)
      expect(root.left.left.title).to eq "Gone In 60 Seconds"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(root, fifth)
      tree.insert(root, royal)
      expect(root.left.right.title).to eq "The Royal Tanenbaums"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(root, rec)
      expect(root.right.title).to eq "[REC]"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(root, empire)
      tree.insert(root, looper)
      expect(root.right.left.title).to eq "Looper"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(root, roger)
      tree.insert(root, mad_max)
      expect(root.right.right.title).to eq "Mad Max: Fury Road"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(root, roger)
      tree.insert(root, mad_max)
      expect(tree.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(root, gone)
      expect(tree.find(root, gone.title).title).to eq "Gone In 60 Seconds"
    end

    it "properly finds a left-left node" do
      tree.insert(root, ace)
      tree.insert(root, gone)
      expect(tree.find(root, gone.title).title).to eq "Gone In 60 Seconds"
    end

    it "properly finds a left-right node" do
      tree.insert(root, fifth)
      tree.insert(root, royal)
      expect(tree.find(root, royal.title).title).to eq "The Royal Tanenbaums"
    end

    it "properly finds a right node" do
      tree.insert(root, rec)
      expect(tree.find(root, rec.title).title).to eq "[REC]"
    end

    it "properly finds a right-left node" do
      tree.insert(root, empire)
      tree.insert(root, looper)
      expect(tree.find(root, looper.title).title).to eq "Looper"
    end

    it "properly finds a right-right node" do
      tree.insert(root, roger)
      tree.insert(root, mad_max)
      expect(tree.find(root, mad_max.title).title).to eq "Mad Max: Fury Road"
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

    it "properly deletes a left-left node" do
      tree.insert(root, ace)
      tree.insert(root, gone)
      tree.delete(root, gone.title)
      expect(tree.find(root, gone.title)).to be_nil
    end

    it "properly deletes a left-right node" do
      tree.insert(root, fifth)
      tree.insert(root, royal)
      tree.delete(root, royal.title)
      expect(tree.find(root, royal.title)).to be_nil
    end

    it "properly deletes a right node" do
      tree.insert(root, rec)
      tree.delete(root, rec.title)
      expect(tree.find(root, rec.title)).to be_nil
    end

    it "properly deletes a right-left node" do
      tree.insert(root, empire)
      tree.insert(root, looper)
      tree.delete(root, looper.title)
      expect(tree.find(root, looper.title)).to be_nil
    end

    it "properly deletes a right-right node" do
      tree.insert(root, roger)
      tree.insert(root, mad_max)
      tree.delete(root, mad_max.title)
      expect(tree.find(root, mad_max.title)).to be_nil
    end
  end

  describe "#printf" do
     specify {
       expected_output = "Indiana Jones and the Last Crusade: 87\nDie Hard: With A Vengeance: 52\nStar Wars: The Empire Strikes Back: 94\nGone In 60 Seconds: 24\nThe Royal Tanenbaums: 80\nLooper: 93\nWho Framed Roger Rabbit: 96\nAce Ventura: Pet Detective: 46\nHarry Potter and the Prisoner of Azkaban: 91\nMad Max: Fury Road: 97\n[REC]: 88\n"
       tree.insert(root, empire)#hope
       tree.insert(root, roger)#empire
       tree.insert(root, die_hard)#jedi
       tree.insert(root, looper)#martian
       tree.insert(root, gone)#pacific
       tree.insert(root, royal)#inception
       tree.insert(root, ace)#bravehaeart
       tree.insert(root, harry)#shawshank
       tree.insert(root, rec)#distric
       tree.insert(root, mad_max)#mad
       expect { tree.printf }.to output(expected_output).to_stdout
     }
=begin
  let (:root) { Node.new("Indiana Jones and the Last Crusade", 87) }

  pacific  let (:gone) { Node.new("Gone In 60 Seconds", 24) }
  brave    let (:ace) { Node.new("Ace Ventura: Pet Detective", 46) }
  jedi     let (:die_hard) { Node.new("Die Hard: With A Vengeance", 52) }
  donnie   let (:fifth) { Node.new("The Fifth Element", 72) }
  inceptionlet (:royal) { Node.new("The Royal Tanenbaums", 80) }
  district let (:rec) { Node.new("[REC]", 88) }
  shawshanklet (:harry) { Node.new("Harry Potter and the Prisoner of Azkaban", 91) }
  martian  let (:looper) { Node.new("Looper", 93) }
  hope     let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  empire   let (:roger) { Node.new("Who Framed Roger Rabbit", 96) }
  madmax   let (:mad_max) { Node.new("Mad Max: Fury Road", 97) }
=end
     specify {
       expected_output = "Indiana Jones and the Last Crusade: 87\nAce Ventura: Pet Detective: 46\nMad Max: Fury Road: 97\nGone In 60 Seconds: 24\nThe Royal Tanenbaums: 80\n[REC]: 88\nDie Hard: With A Vengeance: 52\nHarry Potter and the Prisoner of Azkaban: 91\nLooper: 93\nWho Framed Roger Rabbit: 96\nStar Wars: The Empire Strikes Back: 94\n"
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
