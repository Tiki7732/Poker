require_relative 'hand'

class Player

    attr_accessor :hand, :pot
    def initialize
        @hand = Hand.new
        @pot = 1000
    end
end