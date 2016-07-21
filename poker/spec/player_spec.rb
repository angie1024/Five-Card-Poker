require 'rspec'
require 'card'
require 'hand'
require 'deck'
require 'player'

describe Player do
  subject(:player) { Player.new("Guy") }
  describe "#initialize" do
    it "provides a name" do
      expect(player.name).to eq("Guy")
    end

    it "should contain a hand" do
      expect(player.player_hand.class).to eq(Hand)
    end

    it "should contain a pot of 100" do
      expect(player.pot).to eq(100)
    end
  end

end
