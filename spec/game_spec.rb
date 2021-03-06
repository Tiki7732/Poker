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

        describe "#ante" do
            context "when the player has enough" do
                it "should get ante from current player and add to pot" do
                    game.ante
                    expect(game.pot).to eq(game.minimum)
                    expect(game.current_player.pot).to eq(998)
                end
            end

            context "when the player doesn't have enough money" do
                let(:player1){double("player1", :pot => 0)}
                let(:game2){double("game2", :current_player => player1, :pot => 0)}
                it "should not add ante" do
                    allow(game2).to receive(:ante)
                    game2.ante
                    expect(game2.pot).to be 0
                end
            end
        end

        describe "#bet" do
            context "when player doesn't fold" do
                it "should get bet from player" do
                    game.get_bet(2)
                    expect(game.pot).to be > 0
                end
            end
            # context "when the player folds" do
            # let(:player1){double("player1", :pot => 0)}
            # let(:game2){double("game2", :current_player => player1, :pot => 0)}
            #     it "should not add to pot" do
            #         allow(game2).to receive(:get_bet)
            #         game2.get_bet
            #         expect(game2.pot).to be 0
            #     end
            # end
        end

    end
end