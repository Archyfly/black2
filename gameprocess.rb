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
