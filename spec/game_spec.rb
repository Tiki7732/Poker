require 'rspec'
require 'game'

describe "Part 5" do
    describe Game do
        let(:game){Game.new}

        describe "#initialize" do
            it "should initialize a new deck" do
                expect(game.deck.cards.length).to eq(52)
            end
            it "should have an array of players" do
                expect(game.players).to be_a(Array)
            end
        end

        describe "#deal_cards" do
            it "should deal each player 5 cards" do
                game.deal_cards
                expect(game.players.all?{|player| player.full_hand?}).to be true
            end
        end

        describe "#more_cards" do
            it "should hand out a number of cards to a player" do
                game.deal_cards
                game.more_cards(game.current_player.discard)
                expect(game.current_player.full_hand?).to be true
            end
        end

        describe "#next_player" do
            it "should rotate to next player" do
                player1 = game.current_player
                game.next_player
                player2 = game.current_player
                expect(player1).not_to eq(player2)
                
            end
        end

        describe "#pot_amount?" do
            it "should return amount in pot" do
                expect(game.pot_amount?).to eq(game.pot)
            end
        end

        describe "#get_bets" do
            it "should rotate through players and ask for bets"
        end


    end
end