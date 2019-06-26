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
    @player = gets.chomp

    p "Do you want to game? (yes/no)"
    answer = gets.chomp
    create_new_game if answer == 'yes'

  end


  def create_new_game
    p "now you in game process "
    #while action != 'game_over'
    @game = GameProcess.new @player, 0
    while @game.state != 3 

      @game.increase_bank
      puts "moneys in bank now: #{@game.bank}"
      puts "turn in cards..."
      2.times { @game.turn_in_card_player}
      2.times { @game.turn_in_card_dealer}

      puts "#{@player} cards now: #{@game.show_player_cards}"
      puts "Dealer cards now: #{@game.show_dealer_cards}"
    
      puts "select action:"
      puts "t - turn in one card"
      puts "p - pass"
        
      action = gets.chomp
      case action
      when 't' then
        @game.turn_in_card_player
        puts "#{@player} cards now: #{@game.show_player_cards}"
        @game.calculate_points
        @game.state = 2
      when 'p' then  
        @game.dealer_turn
        @game.calculate_points
        @game.state = 3
      end  
      puts "Round ended." 
    
      puts "select action at end round: v - view stats. n - next game" # test
      at_end = gets.chomp
      case at_end
      when 'v' then 
        puts @game.show_results
        puts @game.show_player_cards
        puts @game.show_dealer_cards
        puts @game.player.moneys
        puts @game.dealer.moneys
        @game.reset 

      when 'n' then
        puts "open cards" #ref
      @game.state = 3

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


