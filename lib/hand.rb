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
        when 3
            return [:FOUR_OF_A_KIND].concat(cards)
        when 4
            return [:FULL_HOUSE].concat(cards)
        when 5
            return [:FLUSH].concat(cards)
        when 6
            return [:STRAIGHT].concat(cards)
        when 7
            discard = cards - find_matches(cards)
            off_suit = highest_card(discard)
            return [:THREE_OF_A_KIND].concat(find_matches(cards)).push(off_suit)
        when 8
            discard = cards - find_matches(cards)
            second_pair = find_matches(discard)
            off_suit = discard - second_pair
            return [:TWO_PAIR].concat(find_matches(cards), second_pair, off_suit)
        when 9
            discard = cards - find_matches(cards)
            off_suit = highest_card(discard)
            return [:ONE_PAIR].concat(find_matches(cards)).push(off_suit)
        when 10
            return[:HIGH_CARD].push(highest_card(cards))
        end
    end

    def rank_hand
        matches = find_matches(cards)
        off_suit = find_matches(cards - matches)
        if flush? &&
            cards.all?{|card| rank_card(card) <= 5}
            return HAND_RANKINGS[:ROYAL_FLUSH]
        elsif flush? && straight?
            return HAND_RANKINGS[:STRAIGHT_FLUSH]
        elsif matches.length == 4
            return HAND_RANKINGS[:FOUR_OF_A_KIND]
        elsif matches.length == 3 && off_suit.length == 2
            return HAND_RANKINGS[:FULL_HOUSE]
        elsif flush? 
            return HAND_RANKINGS[:FLUSH]
        elsif straight?
            return HAND_RANKINGS[:STRAIGHT]
        elsif matches.length == 3 && off_suit.length < 2
            return HAND_RANKINGS[:THREE_OF_A_KIND]
        elsif matches.length == 2 && off_suit.length == 2
            return HAND_RANKINGS[:TWO_PAIR]
        elsif matches.length == 2 && off_suit.length < 2
            return HAND_RANKINGS[:ONE_PAIR]
        else
            return HAND_RANKINGS[:HIGH_CARD]
        end
    end

    def show_hand
        cards.each{|card| print card.to_s + " "}
    end

    def remove_card(positions)
        positions.each {|pos| cards.delete_at(pos - 1)}
    end

    def find_matches(cards_arr)
        card_hash = Hash.new(0)
        cards_arr.each { |card| card_hash[card.symbol] += 1}
        matches = cards_arr.select{|card| card.symbol == card_hash.key(card_hash.values.max)}
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