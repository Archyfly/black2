require_relative './player.rb'
require_relative './card.rb'
require_relative './gameprocess.rb'

class GameInterface
  attr_accessor :player, :game
  attr_reader :status, :actions
  
  def initialize
  @game = game
  @player = player
end
  
  def game_start
    p "Enter your name:"
    @player = gets.chomp

    p "Do you want to game? (yes/no)"
    answer = gets.chomp
    game_process if answer == 'yes'

  end


  def game_process
    p "now you in game process "
    game = GameProcess.new @player, 0
    
    game.increase_bank
    puts "moneys in bank now: #{game.bank}"
    puts "turn in cards..."
    2.times { game.turn_in_card_player}
    2.times { game.turn_in_card_dealer}


    #game.show_cards
    loop do 
      puts "select action:"
      puts "t - turn in one card"
      puts "p - pass"
      puts "o - open cards"
      puts "s - show points"
      puts "r - show results"
      puts "sc - show cards (adm)"
      
      puts "e - exit"
      
      action = gets.chomp
      break if action == 'e'
      case action
        when 't' then
          view(1)  
          game.turn_in_card_player
          game.show_cards
        when 'p' then  
          puts "player pass..."
          view(2)  
          
          game.dealer_turn
          game.state = 2
          game.show_points
          game.show_cards
          game.show_results
        when 'o' then
          puts "open cards"
          view(3)  
          view('cards')
          game.state = 2
          game.show_cards
          game.show_points
          game.show_results
    
        when 's'
          game.show_points
        when 'r'
          game.show_points
          game.show_results
        when 'sc'
          game.show_cards
      end
    end
  end

  def view(state) # варианты того, что выводим на экран.
    case state
      when 1
      # сдаем карты
      # Игрок получает 2 карты
      # Дилер получает 2 карты
      # вносим по 10 в банк
      # считаем полученные очки
      # считаем карты у игрока и дилера, если у игрока карт < 3 - спрашиваем еще надо - если надо - даем карту - если нет - пасс  - состояние меняем
      # дилер смотрит свои карты - опа, меньше 17 - надо еще - даем дилеру еще - считаем очки (игрок уже взял или пасс) - выводим кто выиграл - раунд завершился
      puts "state 1"
      when 'cards'
      puts ""
  
      #puts "#{@dealer.player_name} get one card. #{@dealer.player_name} has #{@dealer.player_deck.size} cards"
      puts "#{@player.player_name} get one card. #{@player.player_name} has #{@player.player_deck.size} cards"

      when 3
      puts "state 3"
      when 4
      puts "state 4"    
    end
  end


    
   

end


game = GameInterface.new
game.game_start


