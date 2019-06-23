require_relative './player.rb'
require_relative './cards.rb'
require_relative './gameprocess.rb'

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


game = Game.new
game.game_start


