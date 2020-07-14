require 'rspec'
require 'card'
require 'colorize'

describe "Part 1" do
    describe Card do
        let (:card) {Card.new('🂡', :black, :spades)}

        describe "#initialize" do
            it "should accept a symbol, color, suit" do
                expect{Card.new('🂡', :black, :spades)}.to_not raise_error
            end
        end

        describe "#symbol" do
            it "should return symbol" do
                expect(card.symbol).to eq('🂡')
            end
        end

        describe "#color" do
            it "should return color" do
                expect(card.color).to eq(:black)
            end
        end

        describe "#suit" do
            it "should return suit" do
                expect(card.suit).to eq(:spades)
            end
        end

        describe "#to_s" do
            it "should puts symbold with specified color" do
                expect(card.to_s).to eq('🂡'.colorize(:black))
            end
        end
    end
end