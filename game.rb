require_relative './player.rb'
require_relative './cards.rb'

class Game
  attr_accessor :player, :game
  attr_reader :status, :actions
  
  def initialize
  @game = game
  
  @player = player
end
  
  def game_start
    p "enter your name:"
    @player = gets.chomp

    p "do you want to game? (yes/no)"
    ask = gets.chomp
    game_process if ask == 'yes'
  end

  def game_process
    p "now you in game process "
    game = GameProcess.new @player, 0
    
    loop do 
      puts "select action:"
      puts "t - turn in cards"
      puts "p - pass"
      puts "o - open cards"
      puts "s - show points"
      puts "r - show results"
      puts "sc - show cards"
      
      puts "e - exit"
      
      action = gets.chomp
      break if action == 'e'
      case action
        when 't' then  
          puts "turn in cards..."
          2.times { game.turn_in_card_player}
          2.times { game.turn_in_card_dealer}
        when 'p' then  
          puts "player pass..."
        when 'o' then
          puts "open cards"
          game.state = 2 
        when 's'
          game.show_points
        when 'r'
          game.show_results
        when 'sc'
          game.show_cards
      end
  end
  end  

end

class GameProcess
  attr_accessor :state

  def initialize(player_gt, state)
    @state = state
    @player = Player.new(player_gt)
    puts "Player in game now: #{@player}"
    puts "Player_name in game now: #{@player.player_name}"
    @dealer = Player.new
    puts "Player in game now: #{@dealer}"
    puts "Player_name in game now: #{@dealer.player_name}"
    puts "state= #{state}"

    @deck = Deck.new
    @deck.create_cards
  end

  def show_cards
    if state == 0
      puts "Player cards: #{@player.player_deck}"
      puts "Dealer cards: **** ****"
    end
    if state == 2
      puts "Player cards: #{@player.player_deck}"
      puts "Dealer cards: #{@dealer.player_deck}"
    end
  end
    
  def turn_in_card_player # одна карта
    @player.player_deck << @deck.random
  end

  def turn_in_card_dealer # одна карта
    @dealer.player_deck << @deck.random
  end
  
  
  def show_points
    @player.calc_points
    @dealer.calc_points
    puts "Player points: #{@player.points}"
    puts "dealer points: #{@dealer.points}"
  end

  def show_results
    if @player.points > @dealer.points
      puts "#{@player.player_name} win!"
      elsif @player.points == @dealer.points
      puts "draw..."
    else
      puts "#{@dealer.player_name} win!"
    end
  end
                
end 

game = Game.new
game.game_start


