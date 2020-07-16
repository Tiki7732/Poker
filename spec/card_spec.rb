require 'rspec'
require 'card'
require 'colorize'

describe "Part 1" do
    describe Card do
        let (:card) {Card.new(:K, :black, :♠)}

        describe "#initialize" do
            it "should accept a symbol, color, suit" do
                expect{Card.new(:K, :black, :♠)}.to_not raise_error
            end
        end

        describe "#symbol" do
            it "should return symbol" do
                expect(card.symbol).to eq(:K)
            end
        end

        describe "#color" do
            it "should return color" do
                expect(card.color).to eq(:black)
            end
        end

        describe "#suit" do
            it "should return suit" do
                expect(card.suit).to eq(:♠)
            end
        end

        describe "#to_s" do
            it "should print symbol with specified color and suit" do
                expect(card.to_s).to eq('K'.colorize(:black) + '♠'.colorize(:black) )
            end
        end
    end
end