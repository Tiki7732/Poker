require_relative 'hand'

class Player

    attr_accessor :hand, :pot, :name
    def initialize(name)
        @name = name
        @hand = Hand.new
        @pot = 1000
    end
    
    def to_s
        @name
    end

    def receive_card(card)
        hand.add_card(card)
    end

    def discard
        p "#{name} can discard up to 3 cards, which cards would you like to discard?"
        hand.show_hand
        print "\n"
        print " 1  2  3  4  5 or none \n"
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

        print " \n The minimum bet is #{minimum}, you can fold, call, or raise \n"
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

    def full_hand?
        return true if hand.cards.length == 5
        false
    end

    def ante_up(minimum)
      if @pot < minimum
          p "You're out of money!" 
          return nil
      end
      @pot -= minimum
      return minimum
    end

    def clear_hand
        @hand.cards = []
    end
end

# lt = Player.new
# p lt.bet(5)