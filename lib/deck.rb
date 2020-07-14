require_relative 'card'

class Deck

    #SPADES = [🂡, 🂢, 🂣, 🂤, 🂥, 🂦, 🂧, 🂨, 🂩, ]
    CARDS = [:A, :2, :3, :4, :5, :6, :7, :8, 9, :10, :J, :Q, :K]
    SUITS = [:♠, :♥, :♦, :♣]
    
    
    attr_reader :cards
    def initialize
        @cards = []
    end

    def shuffle_cards
        @cards.shuffle!
    end


end