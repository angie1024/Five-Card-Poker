require 'rspec'
require 'card'

describe Card do
  subject(:card) { Card.new(4,"D") }

  describe "#initialize" do
    it "card should have face value from 2 to ace" do
      expect(2..14).to include(card.value)
    end

    it "card has a value of 4" do
      expect(card.value).to eq(4)
    end

    it "card has a suit of Diamond" do
      expect(card.suit).to eq("D")
    end

    it "card should have a suit" do
      expect(["D","C","H","S"]).to include(card.suit)
    end
  end


end
