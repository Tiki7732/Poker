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
        when 9
            return [:ONE_PAIR].concat(find_matches)
        end
    end

    def rank_hand
        matches = find_matches
        if cards.all? { |card| card.suit == cards.first.suit} &&
            cards.all?{|card| rank_card(card) <= 5}
            return HAND_RANKINGS[:ROYAL_FLUSH]
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
        rank = 20
        cards_arr.each {|card| rank = rank_card(card) if rank_card(card) < rank}
        rank
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



end