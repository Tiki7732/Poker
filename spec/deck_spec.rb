require 'rspec'
require 'deck'

describe "Part 2" do
    describe Deck do

        let (:deck) {Deck.new}

        describe "#initialize" do
            it "should contain 52 unique cards" do
                expect(deck.cards).to eq(deck.cards.uniq)
                expect(deck.cards.length).to eq(52)
            end
        end

        describe "#shuffle_cards" do 
            it "should suffle cards" do
                deck.shuffle_cards
                expect(deck.cards).to receive(:shuffle!)
            end
        end

        describe "#deal" do
            it "should remove top card from deck"
        end


    end
end