require 'rspec'
require 'hand'

describe 'Part 3' do
    describe  Hand do
        subject(:one_p) {Hand.new}
        subject(:straight_flus) {Hand.new}
        let(:card1){double("card1", :symbol => :K, :suit => :♠)}
        let(:card2){double("card2", :symbol => :K, :suit => :♣)}
        let(:card3){double("card3", :symbol => :Q, :suit => :♣)}
        let(:card4){double("card4", :symbol => 2.to_s.to_sym, :suit => :♦)}
        let(:card5){double("card5", :symbol => 5.to_s.to_sym, :suit => :♥)}  
        let(:card6){double("card1", :symbol => :A, :suit => :♣)}
        let(:card7){double("card2", :symbol => :K, :suit => :♣)}
        let(:card8){double("card3", :symbol => :Q, :suit => :♣)}
        let(:card9){double("card4", :symbol => :J, :suit => :♣)}
        let(:card10){double("card5", :symbol => 10.to_s.to_sym, :suit => :♣)}
        let(:hand1){[card1, card2, card3, card4, card5]}    
        let(:hand2){[card6, card7, card8, card9, card10]}  
        describe '#add_card' do
            
            it "should add a card to the hand" do
                one_p.add_card(card1)
                expect(one_p.cards.length).to eq(1)
            end

        end

        describe "#rank_card" do
            it "should return rank of card" do
                one_p.add_card(card1)
                expect(one_p.rank_card(card1)).to eq(2)
            end
        end

        describe "#highest_card" do
            it "should return rank of highest card" do
                expect(one_p.highest_card([card2,card3])).to eq(2)
            end
        end
        
        describe '#best_hand' do
            it "should show the highest ranking hand" do
                one_p.add_cards(hand1)
                expect(one_p.best_hand).to eq([:ONE_PAIR, card1.to_s, card2.to_s, card3.to_s])
            end
        end

        describe "#find_matches" do
            it "should return cards with matching symbols" do
                one_p.add_cards(hand1)
                expect(one_p.find_matches).to eq([card1, card2])
            end
        end


        describe "#rank_hand" do
            it "should return rank of best hand" do
                one_p.add_cards(hand1)
                straight_flus.add_cards(hand2)
                expect(straight_flus.rank_hand).to eq(1)
                expect(one_p.rank_hand).to eq(9)
            end
        end

        describe "#straight?" do
            it "should return true if the hand is a straight" do
                one_p.add_cards(hand1)
                straight_flus.add_cards(hand2)
                expect(straight_flus.straight?).to eq(true)
                expect(one_p.straight?).to eq(false)
            end
        end

        describe "#flush?" do
            it "should return true if hand is flush" do                
                one_p.add_cards(hand1)
                straight_flus.add_cards(hand2)
                expect(straight_flus.flush?).to eq(true)
                expect(one_p.flush?).to eq(false)
            end
        end

    end
end