require_relative './player.rb'
require_relative './cards.rb'

class Game
  attr_reader :status, :actions
    
  def initialize(player, game)
    @player = player

  end
  
  def actions
    # available_actions for this game status
    # выдать по 2 случайных карты игрокам
    # Посчитать очки у игрока.
    # Посчитать очки у дилера.
    # Посчитать карты у дилера и игрока. Статус 1 если игрок пасс и дилер = 3 карты или игрок = 3 карты и дилер пасс или дилер и игрок = 3 карты.
    # Вывести статистику с учетом статуса (статус 0 - в игре - карты дилера звездочки, статус 1 - открыть карты - карты дилера показываем)

  end
  
  def player_cards
    # выбрать карту рэндомно из колоды
    # передать в массив player_deck
    # убрать карту из колоды
    # !проверка очка 
  end

  def dealer_cards
    # выбрать карту рэндомно из колоды
    # передать в массив dealer_deck
    # убрать карту из колоды...
    # !проверка очка 
  end

  def calculate(player)
    # Подсчет очков
    # если есть туз то -10
  end 
  

  
end

# Terminal Interface
class Interface
  def initialize(game)
    
    @game = game
    
  end
  
  def start_game
    # Цикл с игрой - опрос состояния и показ возможных действий
  end
end

class BJ
attr_reader :player, :dealer
  def initialize
    # Создается "независимый" класс игры, который ничего не знает о том, кто/что и как будет им управлять
    player = Player.new('Mike')
    dealer = Player.new
    game = Game.new(player, dealer) # player и game также лучше спрятать внутрь Game
    
    # Класс интерфейса получает класс игры и теперь управляет ей:
    # 1) Получая состояние/статус игры (вывод информации)
    # 2) Возможные варианты действий - меню (ввод информации)
  end
end

