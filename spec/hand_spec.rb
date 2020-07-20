require 'rspec'
require 'hand'

describe 'Part 3' do
    describe  Hand do
        let (:hand) {Hand.new()}
        let(:card1){double("card1", :symbol => :K, :suit => :♠)}
        let(:card2){double("card2", :symbol => :K, :suit => :♣)}
        let(:card3){double("card3", :symbol => :Q, :suit => :♣)}
        let(:card4){double("card4", :symbol => 2.to_s.to_sym, :suit => :♦)}
        let(:card5){double("card5", :symbol => 5.to_s.to_sym, :suit => :♥)}
        describe '#add_card' do
            
            it "should add a card to the hand" do
                hand.add_card(card1)
                expect(hand.cards.length).to eq(1)
            end

        end

        describe "#rank_card" do
            it "should return rank of card" do
                hand.add_card(card1)
                expect(hand.rank_card(card1)).to eq(2)
            end
        end

        describe "#highest_card" do
            it "should return rank of highest card" do
                expect(hand.highest_card([card2,card3])).to eq(2)
            end
        end
        
        describe '#best_hand' do
            it "should show the highest ranking hand" do
                hand.add_card(card1)
                hand.add_card(card2)
                hand.add_card(card3)
                hand.add_card(card4)
                hand.add_card(card5)
                expect(hand.best_hand).to eq([:ONE_PAIR, card1.to_s, card2.to_s, card3.to_s])
            end
        end

        describe "#find_matches" do
            it "should return cards with matching symbols" do
                hand.add_card(card1)
                hand.add_card(card2)
                hand.add_card(card3)
                hand.add_card(card4)
                hand.add_card(card5)
                expect(hand.find_matches).to eq([card1, card2])
            end
        end

        describe "#rank_hand" do
        let(:card1){double("card1", :symbol => :A, :suit => :♣)}
        let(:card2){double("card2", :symbol => :K, :suit => :♣)}
        let(:card3){double("card3", :symbol => :Q, :suit => :♣)}
        let(:card4){double("card4", :symbol => :J, :suit => :♣)}
        let(:card5){double("card5", :symbol => 10.to_s.to_sym, :suit => :♣)}
            it "should return rank of best hand" do
                hand.add_card(card1)
                hand.add_card(card2)
                hand.add_card(card3)
                hand.add_card(card4)
                hand.add_card(card5)
                expect(hand.rank_hand).to eq(1)
            end
        end

    end
end