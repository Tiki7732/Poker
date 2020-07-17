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
        
        describe '#strongest' do
            it "should show the strongest hand" do
                hand.add_card(card1)
                hand.add_card(card2)
                hand.add_card(card3)
                hand.add_card(card4)
                hand.add_card(card5)
                expect(hand.strongest).to eq(card1, card2)
            end
        end

        describe '#winning?' do
            it "should pick winning hand"
        end
    end
end