require 'rspec'
require 'game'

describe "Part 5" do
    describe Game do

        describe "#initialize" do
            it "should initialize a new deck"
            it "should have an array of players"
        end

        describe "#deal" do
            it "should deal each player 5 cards"
        end

        describe "#more_cards" do
            it "should hand out a number of cards to a player"
        end

        describe "#next_player" do
            it "should rotate to next player"
        end

        describe "#see_pot" do
            it "should return amount in pot"
        end

        describe "#get_bets" do
            it "should rotate through players and ask for bets"
        end

        
    end
end