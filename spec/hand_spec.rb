require 'rspec'
require 'hand'

describe 'Part 3' do
    describe  Hand do
        let (:hand) {Hand.new()}
        describe '#add_card' do
            let(:card){double("card", :symbol => :K)}
            it "should add a card to the hand" do
                hand.add_card(card)
                expect(hand.cards.length).to eq(1)
            end

        end
        
        describe '#strongest' do
            it "should show the strongest hand"
        end

        describe '#winning?' do
            it "should pick winning hand"
        end
    end
end