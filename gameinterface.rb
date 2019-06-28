require_relative './player.rb'
require_relative './card.rb'
require_relative './gameprocess.rb'

class GameInterface
  attr_accessor :player, :game, :bank
  attr_reader :status, :actions
  
  def initialize
    @game = game
    @player = player
    @bank = 0
  end
  
  def game_start
    p "Enter your name:"
    player_gt = gets.chomp
    @player = Player.new(player_gt)
    @dealer = Player.new
    p "Do you want to game? (yes/no)"
    answer = gets.chomp
    if answer == 'yes' 
      create_new_game(@player, @dealer) 
    end
  end


  def create_new_game(player, dealer)
  
    p "now you in game process "
    #while action != 'game_over'
    @game = GameProcess.new player, dealer, 0
    while @game.state < 3 
      @game.start_round
      puts "******** Black Jack Cart Table **************"      
      puts "moneys in bank now: #{@game.bank}"
      puts "turn in cards..."
      
      puts "#{@player} cards now: #{@game.show_player_cards}"
      puts "Dealer cards now: #{@game.show_dealer_cards}"
      puts "*********************************************"  
      puts "select action:"
      puts "t - turn in one card"
      puts "p - pass"
        
      action = gets.chomp
      
      case action
      when 't' then
        @game.turn_in_card_player
        puts "#{@player} cards now: #{@game.show_player_cards}"
        @game.calculate_points
        @game.dealer_turn
        @game.state = 3
        view(@game.state)
        puts "Round ended..."
      
      when 'p' then  
        @game.dealer_turn
        @game.calculate_points
        @game.state = 3
        view(@game.state)
        puts "Round ended..."
      end  
       
   
    end
    @game.reset 
  end
      
  def view(state) # варианты того, что выводим на экран.
    case state
      when 3
      puts ""
        puts @game.show_results
        puts @game.show_player_cards
        puts @game.show_dealer_cards
        puts @game.player.moneys
        puts @game.dealer.moneys
      end
  end    



end



game = GameInterface.new
game.game_start


