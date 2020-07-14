require 'rspec'
require 'card'
require 'colorize'

describe "Part 1" do
    describe Card do
        let (:card) {Card.new('🂡', :black)}

        describe "#initialize" do
            it "should accept a symbol" do
                expect(card.symbol).to eq('🂡')
            end
            it "should accept a color" do
                expect(card.color).to eq(:black)
            end
        end

        describe "#to_s" do
            it "should puts symbold with specified color" do
                expect(card.to_s).to eq('🂡'.colorize(:black))
            end
        end
    end
end