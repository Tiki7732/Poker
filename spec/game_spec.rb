require 'rspec'
require 'game'

describe "Part 5" do
    describe Game do
        let(:game){Game.new}

        describe "#initialize" do
            it "should initialize a new deck" do
                expect(game.deck.length).to eq(52)
            end
            it "should have an array of players" do
                expect(game.players).to be_a(Array)
            end
        end

        describe "#deal" do
            it "should deal each player 5 cards" do
                expect(game.players.all?{|player| player.full_hand?}).to be true
            end
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