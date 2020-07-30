require_relative 'deck'
require_relative 'player'

class Game

    attr_reader :deck, :players, :current_player, :pot, :minimum, :folded_players
    def initialize
        @deck = Deck.new
        @players = []
        4.times {@players.push(Player.new)}
        @current_player = @players.first
        @pot = 0
        @minimum = 2
        @folded_players = []
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

    def get_bet
        bet = @current_player.bet(minimum)
        folded?(bet)
        @pot += bet
    end

    def folded?(bet)
        @folded_players.push(@players.delete(@current_player)) if bet.nil?
    end

    def ante
        ante = @current_player.ante_up(@minimum)
        folded?(ante)
        @pot += ante
    end
end