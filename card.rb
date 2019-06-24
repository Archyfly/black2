require_relative './player.rb'

class Card
  SUITS = %w[<3 <> + ^]
  RANKS = %w[A 2 3 4 5 6 7 8 9 10 V D K]

  attr_reader :suit, :rank
  attr_accessor :value

  def initialize(suit, rank, value)
    @suit = suit
    @rank =  rank
    @value = value
  end
end

=begin
class Game
  attr_accessor :player1, :player2, :c

  c = Deck.new

  c.create_cards
  player1 = Player.new('Pafnytiy')
  player2 = Player.new
end
=end

