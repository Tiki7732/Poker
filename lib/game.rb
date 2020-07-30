require_relative 'deck'
require_relative 'player'

class Game

    attr_reader :deck, :players
    def initialize
        @deck = Deck.new
        @players = []
        4.times {@players.push(Player.new)}
    end
        
end