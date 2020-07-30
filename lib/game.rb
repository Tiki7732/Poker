require_relative 'deck'
require_relative 'player'

class Game

    attr_reader :deck, :players, :current_player, :pot
    def initialize
        @deck = Deck.new
        @players = []
        4.times {@players.push(Player.new)}
        @current_player = @players.first
        @pot = 0
    end
        
    def deal_cards
        3.times {deck.shuffle_cards}
        5.times do 
            players.each do |player|
                player.receive_card(deck.deal)
            end
        end
    end

    def more_cards(num_cards)
        num_cards.times {@current_player.receive_card(deck.deal)}
        current_player.hand.show_hand
    end

    def next_player
        players.rotate!
        @current_player = players.first
    end

    def pot_amount?
        @pot
    end
end