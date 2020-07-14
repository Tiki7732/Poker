require_relative 'card'

class Deck

    attr_reader :cards
    def initialize
        @cards = []
    end

    def shuffle_cards
        @cards.shuffle!
    end


end