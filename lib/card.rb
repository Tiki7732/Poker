require 'colorize'
class Card

    attr_reader :symbol, :color, :suit
    def initialize(symbol, color, suit)
        @symbol = symbol
        @color = color
        @suit = suit
    end

    def to_s
        "#{symbol}".colorize(color)
    end

end
