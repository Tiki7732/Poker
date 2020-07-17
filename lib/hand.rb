require_relative 'card'

class Hand
    HAND_RANKINGS = {:STRAIGHT_FLUSH => 1,
                :FOUR_OF_A_KIND => 2,
                :FULL_HOUSE => 3,
                :FLUSH => 4,
                :STRAIGHT => 5,
                :THREE_OF_A_KIND => 6,
                :TWO_PAIR => 7,
                :ONE_PAIR => 8,
                :HIGH_CARD =>9}
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

    end

    def rank_card(card)
        rank = CARD_RANKINGS[card.symbol]
    end

    def rank_hand

    end

end