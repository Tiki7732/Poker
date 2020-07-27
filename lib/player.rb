require_relative 'hand'

class Player

    def initialize
        @hand = Hand.new
        @pot = 1000
    end
end