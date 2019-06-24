require_relative './player.rb'
require_relative './card.rb'
require_relative './gameprocess.rb'
require_relative './deck.rb'


class GameProcess
  attr_accessor :state, :bank, :bet

  def initialize(player_gt, state)
    @state = state
    @player = Player.new(player_gt)
    puts "Player in game now: #{@player}"
    puts "Player_name in game now: #{@player.player_name}"
    @dealer = Player.new
    puts "Player in game now: #{@dealer}"
    puts "Player_name in game now: #{@dealer.player_name}"
    puts "state= #{state}"
    BET = 10
    @bank = 0 
    @deck = Deck.new
    @deck.create_cards
  end

  def show_cards
    if state == 0
      puts "Player #{@player.player_name} cards: "
      @player.player_deck.each do |card|
        print " #{card.rank}_#{card.suit}"
        end
      puts ""  
      puts "-----------------------"  
      puts "Dealer cards: **** ****"
      puts "-----------------------"
    end
    if state == 2
      puts "Player #{@player.player_name} cards: "
      @player.player_deck.each do |card|
        print " #{card.rank}_#{card.suit}"
        end
      puts ""
      puts "-----------------------"  
      puts "Dealer cards: #{@dealer.player_deck}"
    end
  end
    
  def turn_in_card_player # одна карта
    puts "#{@player.player_name} get one card"
    @player.player_deck << @deck.random

  end

  def turn_in_card_dealer # одна карта
    puts "#{@dealer.player_name} get one card"
    @dealer.player_deck << @deck.random
  end
  
  def dealer_turn
    if @dealer.points < 17
      turn_in_card_dealer
    end
  end
  
  def show_points
    @player.calc_points
    @dealer.calc_points
    puts "Player points: #{@player.points}"
    puts "dealer points: #{@dealer.points}"
  end

  def show_results
    if @player.points > @dealer.points && @player.points <= 21
      puts "#{@player.player_name} win!"
    elsif @player.points == @dealer.points
      puts "draw..."
    elsif @player.points < @dealer.points && @dealer.points <= 21
      puts "#{@dealer.player_name} win!"
    end
  end

  def increase_bank(bet)
    @bank += bet
  end

  def decrease_bank(bet)
    @bank -= bet
  end
                
end 
