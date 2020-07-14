require_relative 'card'

class Deck

    #SPADES = [🂡, 🂢, 🂣, 🂤, 🂥, 🂦, 🂧, 🂨, 🂩, ]
    SYMBOLS = [:A, :2, :3, :4, :5, :6, :7, :8, :9, :10, :J, :Q, :K]
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

    def shuffle_cards
        @cards.shuffle!
    end


end