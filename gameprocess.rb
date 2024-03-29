require_relative './player.rb'
require_relative './card.rb'
require_relative './gameprocess.rb'
require_relative './deck.rb'


class GameProcess
  attr_accessor :state, :bank, :bet, :player, :dealer
  BET = 10

  def initialize(player, dealer, state)
      
    @player = player
    @dealer = dealer
    #puts "Player in game now: #{@player}"
    #puts "Player_name in game now: #{@player.player_name}"
    @state = 0
    @bank = 0 
    @deck = Deck.new
    @deck.create_cards
    @dealer_deck = []
    @player_deck = []
    #puts "Player in game now: #{@dealer}"
    #puts "Player_name in game now: #{@dealer.player_name}"
    #puts "state= #{state}"
     
  end

  def reset
    @state = 0
    @bank = 0 
    @deck = Deck.new
    @deck.create_cards
    @dealer_deck = []
    @player_deck = []
  end

  def turn_in_card_player # одна карта
    
    rc = @deck.random
    # puts below only for control 
    
    puts "rcp=#{rc}"
    @player.player_deck << rc
    show_player_cards
  end

  def turn_in_card_dealer # одна карта
    rc = @deck.random
    # puts below only for control 
    puts "rcd=#{rc}"
    @dealer.player_deck << rc
    show_dealer_cards  
  end
  
  def dealer_turn
    turn_in_card_dealer if @dealer.points < 17 
  end
  
  def calculate_points
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
    state = 3
  end  
 
  def players_to_bank
    @player.moneys - BET
    @dealer.moneys - BET
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
    decrease_bank
    puts "Player WIN!"
    
  end

  def dealer_win
    @dealer.moneys += @bank
    decrease_bank
    puts "Dealer WIN"
  end

  def draw
    @player.moneys += BET
    @dealer.moneys += BET
    decrease_bank
    puts "Draw..."
  end
   
  def show_player_cards
    player_deck = []
    @player.player_deck.each do |card|
      player_deck << "#{card.rank}_#{card.suit}" 
    end
    return player_deck
  end

  def show_dealer_cards 
    dealer_deck = ['*** ***']

    if state > 1
      dealer_deck = []

      @dealer.player_deck.each do |card|
        dealer_deck << "#{card.rank}_#{card.suit}" 
      end
    end  
    return dealer_deck
  end
  
  def start_round #mr_koww - при старте раунда переносим только банк. 
    @deck = Deck.new
    # puts below only for control 
    puts "@deck= #{@deck}"
    @deck.create_cards
    2.times { self.turn_in_card_player}
    2.times { self.turn_in_card_dealer}
    players_to_bank
    
    @state = 1
  end


 

end 
