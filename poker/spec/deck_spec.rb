require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "creates a 52 card deck" do
      expect(deck.deck.length).to eq(52)
    end

    it "should only be 13 cards for each suit" do
      suit_count = Hash.new(0)
      deck.deck.each do |card|
        suit_count[card.suit] += 1
      end

      expect(suit_count.values).to eq([13,13,13,13])
    end

    it "should have 4 of each value" do
      value_count = Hash.new(0)
      deck.deck.each do |card|
        value_count[card.value] += 1
      end

      expect(value_count.values.uniq).to eq([4])
    end
  end


end
