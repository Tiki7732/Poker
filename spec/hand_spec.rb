require 'rspec'
require 'hand'

describe 'Part 3' do
    describe  Hand do
        let (:hand) {Hand.new()}
        describe '#initialize' do
            it "should have 5 cards"

        end
        
        describe '#strongest' do
            it "should show the strongest hand"
        end

        describe '#winning?' do
            it "should pick winning hand"
        end
    end
end