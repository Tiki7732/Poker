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
        case rank_hand
        when 1
            return [:ROYAL_FLUSH].concat(cards)
        when 2
            return [:STRAIGHT_FLUSH].concat(cards)
        when 9
            discard = cards - find_matches
            off_suit = highest_card(discard)
            return [:ONE_PAIR].concat(find_matches).push(off_suit)
        end
    end

    def rank_hand
        matches = find_matches
        if flush? &&
            cards.all?{|card| rank_card(card) <= 5}
            return HAND_RANKINGS[:ROYAL_FLUSH]
        elsif flush? && straight?
            return HAND_RANKINGS[:STRAIGHT_FLUSH]
        elsif
            matches.length == 2
            return HAND_RANKINGS[:ONE_PAIR]
        else
            return HAND_RANKINGS[:HIGH_CARD]
        end
    end

    def find_matches
        card_hash = Hash.new(0)
        cards.each { |card| card_hash[card.symbol] += 1}
        matches = cards.select{|card| card.symbol == card_hash.key(card_hash.values.max)}
        matches
    end

    def highest_card(cards_arr)
        cards_arr.sort!{|card| rank_card(card)}.reverse!
        cards_arr.first
    end

    def rank_card(card)
        CARD_RANKINGS[card.symbol] 
    end

    def straight?
        test = cards.map{|card| rank_card(card)}
        test.sort!
        return true if (test.last - test.first) == 4
        false
    end

    def flush?
        test = cards.map{|card| card.suit}
        test.uniq!
        return true if test.length == 1
        return false
    end

    def add_cards(card_arr)
        @cards = card_arr
    end
end