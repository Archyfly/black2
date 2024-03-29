require_relative './player.rb'
require_relative './card.rb'

class Deck

  attr_reader :deck, :cards

  def initialize
    @cards = []
  end

  def create_cards
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        if "A".include?(rank)
          value = 11
        elsif "VDK".include?(rank)
          value = 10
        else
          value = rank.to_i
        end
       @cards << Card.new(suit, rank, value)
      end
    end
    #puts @cards.size
  end

  def random
    #random_card = self.cards[rand(@cards.size)]
    random_card = self.cards.sample

    #puts "random_card = #{random_card}, #{random_card.rank}_#{random_card.suit} "

    cards.delete(random_card)
    #puts @cards.size
    return random_card
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

