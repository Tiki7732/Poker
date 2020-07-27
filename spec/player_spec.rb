require 'rspec'
require 'player'

describe "Part 4" do
    describe Player do
        let(:player1){Player.new}
        describe "#initialize" do
            it "should initialize player with a pot" do
                expect(player1.pot).to be > 0
            end
            it "should initialize with an empty hand" do
                expect(player1.hand.cards.length).to equal(0)
            end
        end

        describe "#bet" do
            it "should place a bet between 0 and total pot of player" do
                expect(player1.bet).to be_between(1, player1.pot)
                #expect(player1.bet).to be <= (player1.pot)
            end
        end

        describe "#discard" do
            it "should remove up to 4 cards from players hand"

            it "should draw an equal number of new cards from deck"
        end
    end
end
