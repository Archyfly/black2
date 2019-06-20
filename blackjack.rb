require_relative './player.rb'
require_relative './cards.rb'
require_relative './bank.rb'
require_relative './calc.rb'

class BlackJack
  def initialize
    # Создается "независимый" класс игры, который ничего не знает о том, кто/что и как будет им управлять
    player = Player.new('Sergey')
    dealer = Dealer.new
    game = Game.new(player, dealer) # player и game также лучше спрятать внутрь Game
    
    # Класс интерфейса получает класс игры и теперь управляет ей:
    # 1) Получая состояние/статус игры (вывод информации)
    # 2) Возможные варианты действий - меню (ввод информации)
    TerminalInterface.new(game)
    # or
    TelegramInterface.new(game)
  end
