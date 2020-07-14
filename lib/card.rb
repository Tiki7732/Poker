require 'colorize'
class Card

    attr_reader :symbol, :color
    def initialize(symbol, color)
        @symbol = symbol
        @color = color
    end

    def to_s
        "#{symbol}".colorize(color)
    end

end
