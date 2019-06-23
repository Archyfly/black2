# class player for name, bank
class Player
  attr_accessor :player_name, :moneys, :player_deck, :points

  def initialize(player_name = 'Dealer')
    @player_name = player_name
    @moneys = 100
    @player_deck = []
    @points = 0
  end

  def calc_points
    points = 0 # подсчет заново каждый раз
    @aces = 0
    puts "player_deck = #{self.player_deck}"
    self.player_deck.each do |card| 
      puts "card.value = #{card.value}" 
      points = points + card.value  
      if card.rank.include?('A')
      @aces += 1
      end
    end
    @points += points
    @points -= 10 if @points > 21 && @aces > 0
  puts "current player points = #{@points}"  
  puts "current player aces = #{@aces}"  
      

  end


end
