require_relative './player.rb'
require_relative './card.rb'
require_relative './gameprocess.rb'
require_relative './deck.rb'


class GameProcess
  attr_accessor :state, :bank, :bet
  BET = 10

  def initialize(player_gt, state)
    @state = state
    @player = Player.new(player_gt)
    #puts "Player in game now: #{@player}"
    #puts "Player_name in game now: #{@player.player_name}"
    @dealer = Player.new
    #puts "Player in game now: #{@dealer}"
    #puts "Player_name in game now: #{@dealer.player_name}"
    #puts "state= #{state}"
    @bank = 0 
    @deck = Deck.new
    @deck.create_cards
  end

  def turn_in_card_player # одна карта
    @player.player_deck << @deck.random
  end

  def turn_in_card_dealer # одна карта
    @dealer.player_deck << @deck.random
  end
  
  def dealer_turn
    turn_in_card_dealer if @dealer.points < 17 
  end
  
  def show_points
    @player.calc_points
    @dealer.calc_points
    #puts "Player points: #{@player.points}"
    #puts "dealer points: #{@dealer.points}"
  end

  def show_results
    if @player.points > @dealer.points && @player.points <= 21
      #puts "#{@player.player_name} win!"
      player_win
    elsif @player.points == @dealer.points
      draw
    elsif @player.points < @dealer.points && @dealer.points <= 21
      dealer_win
    end
  end  
 
  def players_to_bank
    @player.moneys - 10
    @dealer.moneys - 10
    @bank = 20
  end
  
  def increase_bank
    @bank += 20
  end

  def decrease_bank
    @bank -= 20
  end
  
  def player_win
    @player.moneys += @bank
    @bank -= 20
  end

  def dealer_win
    @dealer.moneys += @bank
  end

end 
