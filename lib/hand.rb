require_relative 'card'

class Hand
    HAND_RANKINGS = {:ROYAL_FLUSH => 1,
                :STRAIGHT_FLUSH => 2,
                :FOUR_OF_A_KIND => 3,
                :FULL_HOUSE => 4,
                :FLUSH => 5,
                :STRAIGHT => 6,
                :THREE_OF_A_KIND => 7,
                :TWO_PAIR => 8,
                :ONE_PAIR => 9,
                :HIGH_CARD => 10}
    CARD_RANKINGS = {:A => 1, :K => 2, :Q => 3, :J => 4, :'10' => 5, :'9' => 6, 
                    :'8' => 7, :'7' => 8, :'6' => 9, :'5' => 10, :'4' => 11, 
                    :'3' => 12, :'2' => 13}

    attr_reader :cards
    def initialize
        @cards = []
    end

    def add_card(card)
        cards.push(card)
    end

    def best_hand
        case cards.rank_hand
        when 1
            return [:ROYAL_FLUSH, ]
        when :ONE_PAIR
            return [:ONE_PAIR, ]
        end
    end

    def highest_card(cards_arr)
        rank = 20
        cards_arr.each {|card| rank = rank_card(card) if rank_card(card) < rank}
        rank
    end

    def rank_card(card)
        CARD_RANKINGS[card.symbol] 
    end

    def rank_hand
        # case cards
        # when cards.each {|card| p rank_card(card)} 
        #     p cards.length
        #     same_suit = cards.all? { |card| card.suit == cards.first.suit}
        #     p same_suit
        #     #&&
        #     #cards.all?{|card| rank_card(card) <= 5}
        #     return :ROYAL_FLUSH
        # else
        #     return :HIGH_CARD
        # end
    end

end