require 'rspec'
require 'hand'

describe 'Part 3' do
    describe  Hand do
        subject(:one_p) {Hand.new}
        subject(:straight_flus) {Hand.new}
        subject(:four){Hand.new}
        subject(:full){Hand.new}
        subject(:two_p){Hand.new}
        let(:card1){double("card1", :symbol => :K, :suit => :♠)}
        let(:card2){double("card2", :symbol => :K, :suit => :♣)}
        let(:card3){double("card3", :symbol => :Q, :suit => :♣)}
        let(:card4){double("card4", :symbol => 2.to_s.to_sym, :suit => :♦)}
        let(:card5){double("card5", :symbol => 5.to_s.to_sym, :suit => :♥)}  
        let(:card6){double("card6", :symbol => :A, :suit => :♣)}
        let(:card7){double("card7", :symbol => :K, :suit => :♥)}
        let(:card8){double("card8", :symbol => :Q, :suit => :♥)}
        let(:card9){double("card9", :symbol => :J, :suit => :♣)}
        let(:card10){double("card10", :symbol => 10.to_s.to_sym, :suit => :♣)}
        let(:card11){double("card11", :symbol => :Q, :suit => :♦)}
        let(:card12){double("card12", :symbol => :K, :suit => :♦)}
        let(:hand1){[card1, card2, card3, card4, card5]}    
        let(:hand2){[card6, card3, card2, card9, card10]}
        let(:hand3){[card1, card2, card7, card12, card9]}
        let(:hand4){[card1, card2, card7, card3, card8]}
        let(:hand5){[card1, card2, card3, card8, card10]}
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
                expect(one_p.highest_card([card2,card3])).to eq(card2)
            end
        end
        
        describe '#best_hand' do
            it "should show the highest ranking hand" do
                one_p.add_cards(hand1)
                four.add_cards(hand3)
                two_p.add_cards(hand5)
                expect(four.best_hand).to eq([:FOUR_OF_A_KIND].concat(hand3))
                expect(one_p.best_hand).to eq([:ONE_PAIR, card1, card2, card3])
                expect(two_p.best_hand).to eq([:TWO_PAIR].concat(hand5))
            end
        end

        describe "#find_matches" do
            it "should return cards with matching symbols" do
                one_p.add_cards(hand1)
                full.add_cards(hand4)
                expect(one_p.find_matches(hand1)).to eq([card1, card2])
                expect(full.find_matches(hand4)).to eq([card1, card2, card7])
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

        describe "#show_hand" do
            it "should print out hand" do
                straight_flus.add_cards(hand2)
                straight_flus.show_hand
            end
        end

    end
end