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

    def discard
        p "Which cards would you like to discard?"
        hand.show_hand
        p "\n"
        p "1 2 3 4 5 or none"
        discard = gets.chomp
        case discard
        when "none"
            return
        else
            cards = discard.split("").map!(&:to_i)
            hand.remove_card(cards)
        end

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