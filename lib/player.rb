require_relative 'hand'

class Player

    attr_accessor :hand, :pot
    def initialize
        @hand = Hand.new
        @pot = 1000
    end

    def receive_card(card)
        hand.add_card(card)
    end

    def bet
        amount = nil
        until amount && amount.between?(1, pot)
            p "The minimum bet is $1"
            amount = gets.chomp.to_i
        end
        amount
    end
end

# lt = Player.new
# p lt.bet