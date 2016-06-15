include RSpec

require_relative 'mystack'

RSpec.describe MyStack, type: Class do
  let(:stack) { MyStack.new }

  describe "#push" do
    it "pushes an item on top of the stack" do
      expect(stack.top).to eq nil
      stack.push("Rob")
      expect(stack.top).to eq "Rob"
    end

    it "pushes an item on top of the stack" do
      expect(stack.top).to eq nil
      stack.push("Rob")
      expect(stack.top).to eq "Rob"
      stack.push("Ben")
      expect(stack.top).to eq "Ben"
    end
  end

  describe "#pop" do
    it "pops an item off the top of the stack and returns it" do
      stack.push("Ben")
      stack.push("Rob")
      expect(stack.top).to eq "Rob"
      item = stack.pop
      expect(item).to eq "Rob"
      expect(stack.top).to eq "Ben"
      item = stack.pop
      expect(item).to eq "Ben"
      expect(stack.top).to eq nil
    end
  end

  describe "#empty?" do
    it "returns true when the stack is empty" do
      expect(stack.empty?).to eq true
    end

    it "returns false when the stack is not empty" do
      stack.push("Rob")
      expect(stack.empty?).to eq false
    end
  end
end