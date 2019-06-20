# class player for name, bank
class Player
  attr_accessor :player_name, :moneys, :player_deck, :points

  def initialize(player_name = 'Dealer')
    @player_name = player_name
    @moneys = 100
    @player_deck = []
    @points = 0
  end

end
