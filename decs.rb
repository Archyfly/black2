# формируем колоду
require_relative './cards.rb'
class Decs
  SUIT = ['+', '<3', '^', '<>']
  VAL = [2, 3, 4, 5, 6, 7, 8, 9, 10]
  PICS = ['V', 'D', 'K']
  attr_accessor :cards

  def initialize
    @deck = {}
  end

  def create_new_deck  

  end

# проверка рэндом выборки. Учесть, что карты отлаживаются по колодам, из основной колоды выщелкиваются
  def random_card
    @deck_rand = []
    @deck.each_key { |key| @deck_rand << key }
    @selected_card = @deck_rand[rand(@deck_rand.size)]
    #send("summ", @deck[@selected_card])
     
    #puts @selected_card
    #puts @deck[@selected_card]
    #puts "Deck Size #{@deck.size}"
 
    #puts "deck updated. new deck #{@deck}"
    return @selected_card
       
  end

  

  def summ(points)
    puts "Points = #{points}"
  end
  

end
