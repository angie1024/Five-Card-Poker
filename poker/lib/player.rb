require_relative 'hand'


class Player
  attr_reader :name, :player_hand
  attr_accessor :pot

  def initialize(name)
    @name = name
    @player_hand = Hand.new(Deck.new)
    @pot = 100
  end

  def discard_cards
    puts "Enter indices of up to three cards to remove ex.(0,2,3)"
    @player_hand.remove_cards(parse_input)
  end

  def parse_input
    gets.chomp.split(",").to_a
  end

end
