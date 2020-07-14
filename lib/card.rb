require 'colorize'
class Card

    attr_reader :symbol, :color
    def initialize(symbol, color)
        @symbol = symbol
    end

    def to_s
        "#{symbol}".colorize(color)
    end

end
