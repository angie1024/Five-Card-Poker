class Deck
  attr_reader :deck
  SUIT = [ "D", "C", "H", "S" ]
  VALUE = (2..14).to_a

  def initialize
    @deck = []
    populate
  end

  def populate
    SUIT.each do |suit|
      VALUE.each do |value|
        @deck << Card.new(value, suit)
      end
    end
  end

  def remove_card
    @deck.shuffle.pop
  end

end
