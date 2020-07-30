require_relative 'deck'
require_relative 'player'

class Game

    attr_reader :deck, :players
    def initialize
        @deck = Deck.new
        @players = []
        4.times {@players.push(Player.new)}
    end
        
    def deal_cards
        3.times {deck.shuffle_cards}
        5.times do 
            players.each do |player|
                player.receive_card(deck.deal)
            end
        end
    end
end