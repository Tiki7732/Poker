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
            end
        end

        describe "#discard" do
        let(:card1){double("card1", :symbol => :K, :suit => :♠)}
        let(:card2){double("card2", :symbol => :K, :suit => :♣)}
        let(:card3){double("card3", :symbol => :Q, :suit => :♣)}
        let(:card4){double("card4", :symbol => 2.to_s.to_sym, :suit => :♦)}
        let(:card5){double("card5", :symbol => 5.to_s.to_sym, :suit => :♥)} 
        let(:hand1){[card1, card2, card3, card4, card5]} 
            it "should remove up to 4 cards from players hand" do
                player1.hand.add_cards(hand1)
                player1.discard
                expect(player1.hand.cards.length).to be < 5
            end
        end
    end
end
