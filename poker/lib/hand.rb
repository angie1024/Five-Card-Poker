require_relative 'deck'
require_relative 'card'

class Hand
  attr_reader :hand
  attr_accessor :best_hand

  HIERARCHY = {
    "Royal Flush" => 10,
    "Straight Flush" => 9,
    "Four of a Kind" => 8,
    "Full House" => 7,
    "Flush" => 6,
    "Straight" => 5,
    "Three of a Kind" => 4,
    "Two Pair" => 3,
    "Pair" => 2,
    "High Card" => 1,
  }

  def initialize(deck)
    @deck = deck
    @hand = []
    @best_hand = []
    populate_hand
  end

  def add_card
    @hand << @deck.remove_card
  end

  def remove_cards(*card_indices)

  end

  def populate_hand
    5.times { add_card }
  end

  def find_best_hand
    no_pair
    pair
    two_pair
    three_of_a_kind
    straight
    flush
    full_house
    four_of_kind
    straight_flush
    royal_flush
  end

  def card_values
    @hand.map { |card| card.value }.sort
  end

  def card_suit
    @hand.map { |card| card.suit }
  end

  def royal_flush
    if card_suit.all? { |suit| suit == card_suit.first } && card_values == (10..14).to_a
      @best_hand = ["Royal Flush", nil]
    end
  end

  def straight_flush
    if card_suit.all? { |suit| suit == card_suit.first } &&
      (card_values.size-1).times.all? { |i| card_values[i+1] == card_values[i] + 1 }
      @best_hand = ["Straight Flush", card_values.min]
    end
  end


  def four_of_kind
    if card_values.any? { |value| card_values.count(value) == 4 }
      rank = card_values.find { |value| card_values.count(value) == 4 }
      @best_hand = ["Four of a Kind", rank]
    end
  end

  def full_house
    if card_values.count(card_values.first) == 3
      if card_values.drop(3).all? { |value| value == card_values.drop(3).first }
        rank = card_values.find { |value| card_values.count(value) == 3 }
        @best_hand = ["Full House", rank]
      end
    elsif card_values.count(card_values.first) == 2
      if card_values.drop(2).all? { |value| value == card_values.drop(2).first }
        rank = card_values.find { |value| card_values.count(value) == 3 }
        @best_hand = ["Full House", rank]
      end
    end
  end

  def flush
    if card_suit.all? { |suit| suit == card_suit.first }
      @best_hand = ["Flush", card_values.max]
    end
  end

  def straight
    if (card_values.size-1).times.all? { |i| card_values[i+1] == card_values[i] + 1 }
      @best_hand = ["Straight", card_values.min]
    end
  end

  def three_of_a_kind
    if card_values.any? { |value| card_values.count(value) == 3}
      rank = card_values.find { |value| card_values.count(value) == 3 }
      @best_hand = ["Three of a Kind", rank]
    end
  end


  def two_pair
    dups = card_values.select { |value| card_values.count(value) > 1 }
    if dups.uniq.count == 2
      @best_hand = ["Two Pair", dups.max]
    end
  end

  def pair
    if card_values.any? { |value| card_values.count(value) == 2 }
      rank = card_values.find { |value| card_values.count(value) == 2 }
      @best_hand = ["Pair", rank]
    end
  end

  def no_pair
    @best_hand = ["High Card", card_values.max]
  end


end
