require 'rspec'
require 'deck'

describe "Part 2" do
    describe Deck do

        let (:deck) {Deck.new}

        describe "#populate_deck" do
            it "should contain 52 unique cards" do
                deck.populate_deck
                expect(deck.cards).to eq(deck.cards.uniq)
                expect(deck.cards.length).to eq(52)
            end
        end

        describe "#shuffle_cards" do 
            it "should suffle cards" do
                deck.populate_deck
                unshuffled = deck.cards.dup
                deck.shuffle_cards
                expect(unshuffled).to_not eq(deck.cards)
            end
        end

        describe "#deal" do
            it "should remove top card from deck" do
                 deck.populate_deck
                top_card = deck.cards.first
                expect(deck.deal).to eq(top_card)
                expect(deck.cards).to_not include(top_card)
            end
        end


    end
end