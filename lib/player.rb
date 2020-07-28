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
            return nil
        else
            cards = discard.split("").map!(&:to_i)
            hand.remove_card(cards)
            return cards.length
        end

    end

    def bet(minimum)
        if minimum > pot
            p "You do not have enough to bet"
            return nil
        end

        p "The minimum bet is #{minimum}, you can fold, call, or raise"
        action = gets.chomp

        case action
        when 'fold'
            return nil
        when 'call'
            @pot -= minimum
            return minimum
        when 'raise'
            amount = get_amount(minimum)
            p "All in!" if amount == pot
            @pot -= amount
            return amount
        end
        
      
    end

    def get_amount(minimum)
        amount = nil
        p "You currently have #{pot - minimum} to raise with"
        p "How much would you like to raise?"
        until amount && amount <= (pot - minimum)
            amount = gets.chomp.to_i
            if amount > (pot - minimum)
                amount = nil
                p "You do not have enough in your pot, you can raise up to #{pot - minimum}"
                next
            end
            return amount + minimum
        end
    end

    def add_to_pot(amount)
        @pot += amount
    end
end

# lt = Player.new
# p lt.bet(5)