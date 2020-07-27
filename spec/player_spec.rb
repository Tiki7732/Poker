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
    end
end
