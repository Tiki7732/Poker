require 'rspec'
require 'deck'

describe Deck do

    let (:deck) {Deck.new}

    describe "#initialize" do
        it "should contain 52 unique cards"
        it "should have 4 suits"
    end

    describe "#shuffle" do 
        it "should suffle cards"
    end

    describe "#deal" do
        it "should remove top card from deck"
    end


end