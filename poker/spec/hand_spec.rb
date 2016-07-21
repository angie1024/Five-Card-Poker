require 'hand'
require 'rspec'
require 'card'
require 'deck'

describe Hand do
  let(:deck) { Deck.new }
  subject(:hand) { Hand.new(deck) }

  describe "#initialize" do
    it "contains five card objects" do
      classes = hand.hand.map { |card| card.class }
      expect(hand.hand.length).to eq(5)
      expect(classes.uniq).to eq([Card.new(2,"D").class])
    end

    it "contains five" do
      classes = hand.hand.map { |card| card.class }
      expect(hand.hand.length).to eq(5)
    end

    it "calls add_cards five times"



  end

  describe "#add_card" do
    it "it adds a card to the hand" do
      hand.add_card
      expect(hand.hand.length).to eq(6)
    end
  end

  describe "#remove_card" do
    it "removes card from hand" do
      hand.remove_card
      expect(hand.hand.length).to eq(4)
    end
  end

    it "card should have a suit"

  # before(:each) { (10..14).each do |i|
  #   hand.hand << Card.new(i, "D")
  # end}
  describe "hand hierarchy" do
    it "royal flush is valid" do
      hand.hand.pop(5)
      (10..14).each do |i|
        hand.hand << Card.new(i, "D")
      end
      hand.royal_flush
      expect(hand.best_hand).to eq(["Royal Flush",nil])
    end

    it "straight flush is valid" do
      hand.hand.pop(5)
      (10..14).each do |i|
        hand.hand << Card.new(i, "D")
      end
      hand.straight_flush
      expect(hand.best_hand).to eq(["Straight Flush",10])
    end

    it "four_of_kind is valid" do
      hand.hand.pop(5)
      [2,2,2,2,1].each do |i|
        hand.hand << Card.new(i, "D")
      end
      hand.four_of_kind
      expect(hand.best_hand).to eq(["Four of a Kind",2])
    end

    it "full_house is valid" do
      hand.hand.pop(5)
      [2,2,2,1,1].each do |i|
        hand.hand << Card.new(i, "D")
      end
      hand.full_house
      expect(hand.best_hand).to eq(["Full House", 2])
    end

    it "flush is valid" do
      hand.hand.pop(5)
      [2,2,3,1,1].each do |i|
        hand.hand << Card.new(i, "D")
      end
      hand.flush
      expect(hand.best_hand).to eq(["Flush", 3])
    end

    it "straight is valid" do
      hand.hand.pop(5)
      [2,3,4,5,6].each do |i|
        hand.hand << Card.new(i, "D")
      end
      hand.straight
      expect(hand.best_hand).to eq(["Straight", 2])
    end

    it "three_of_a_kind is valid" do
      hand.hand.pop(5)
      [3,3,3,5,6].each do |i|
        hand.hand << Card.new(i, "D")
      end
      hand.three_of_a_kind
      expect(hand.best_hand).to eq(["Three of a Kind", 3])
    end

    it "two_pair is valid" do
      hand.hand.pop(5)
      [3,3,1,5,5].each do |i|
        hand.hand << Card.new(i, "D")
      end
      hand.two_pair
      expect(hand.best_hand).to eq(["Two Pair", 5])
    end

    it "pair is valid" do
      hand.hand.pop(5)
      [3,2,1,5,5].each do |i|
        hand.hand << Card.new(i, "D")
      end
      hand.pair
      expect(hand.best_hand).to eq(["Pair", 5])
    end

    it "no_pair is valid" do
      hand.hand.pop(5)
      [3,2,1,9,5].each do |i|
        hand.hand << Card.new(i, "D")
      end
      hand.no_pair
      expect(hand.best_hand).to eq(["High Card", 9])
    end
  end
end
