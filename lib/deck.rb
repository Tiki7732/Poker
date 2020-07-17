require_relative 'card'

class Deck

    SYMBOLS = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'].map(&:to_sym)
    SUITS = [:♠, :♥, :♦, :♣]

    
    attr_reader :cards
    def initialize
        @cards = []
        self.populate_deck
    end

    def populate_deck
        SUITS.each do |suit|
            color = :black if (suit == :♠ || suit == :♣)
            color = :red if (suit == :♥ || suit == :♦)
            SYMBOLS.each do |symbol|
                @cards.push(Card.new(symbol, color, suit))
            end
        end

    end

    def show_cards
        cards.each { |card| print card.to_s + " "}
    end

    def shuffle_cards
        @cards.shuffle!
    end

    def deal
        cards.shift
    end
end

# d = Deck.new
# d.show_cards
# d.shuffle_cards
# print "\n"
# d.show_cards
# print "\n"
# print d.deal
# print "\n"