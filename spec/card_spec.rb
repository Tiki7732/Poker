require 'rspec'
require 'card'

describe "Part 1" do
    describe Card do
        let (:card) {Card.new}

        describe "#initialize" do
            it "should accept a symbol"
            it "should accept a color"
        end

        describe "#to_s" do
            it "should puts symbold with specified color"
        end
    end
end