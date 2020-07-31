require_relative 'deck'
require_relative 'player'

class Game

    attr_reader :deck, :players, :current_player, :pot, :minimum, :folded_players
    def initialize
        @deck = Deck.new
        @players = [player1 = Player.new("Laurent"), player2 = Player.new("Roxane"),
             player3 = Player.new("Chistine"), player4 = Player.new("Bowie")]
        @current_player = @players.first
        @pot = 0
        @minimum = 2
        @folded_players = []
    end
        
    def deal_cards
        3.times {deck.shuffle_cards}
        5.times do 
            players.each do |player|
                player.receive_card(deck.deal)
            end
        end
    end

    def more_cards(num_cards)
        num_cards.times {@current_player.receive_card(deck.deal)}
        #@current_player.hand.show_hand
    end

    def next_player
        players.rotate!
        @current_player = players.first
    end

    def pot_amount?
        @pot
    end

    def get_bet(amount)
        @players.each do |player|
            system("clear")
            p "#{player} it is your turn"
            p "The pot is at #{pot}"
            p "You have #{player.pot}"
            player.hand.show_hand
            bet = player.bet(amount)
            folded?(player) if bet.nil?
            next if bet.nil?
            amount = bet
            @pot += amount
        end
        @players.select!{|player| !@folded_players.include?(player)}

    end


    def folded?(player)
        @folded_players.push(player)
    end

    def ante
        @players.each do |player|
            p "#{player} ante up!"
            ante = player.ante_up(minimum)
            folded?(player) if ante.nil?
            next if ante.nil?
            @pot += ante
            sleep(1)
        end
    end

    def game_over?
        all_players = @players + @folded_players
        players_with_money = 0
        all_players.each do |player|
            players_with_money += 1 if player.pot >= minimum
        end
        return true if players_with_money <= 1
        false
    end

    def round_over?
        if @players.length == 1
            @players.first.add_to_pot(@pot)
            @pot = 0
            p "#{@players.first} wins!"
            sleep(1)
            return true
        end
    end

    def play_round
        system("clear")
        @deck.populate_deck
        @players.concat(@folded_players)
        @folded_players = []
        @players.each {|player| player.clear_hand}
        self.ante
        self.deal_cards
        self.get_bet(@minimum)
        return if round_over?
        @players.each do |player|
            system("clear")
            @current_player = player
            more_cards(player.discard)
            player.hand.show_hand
            sleep(2)
        end
        self.get_bet(@minimum)
        return if round_over?
        winner = @players.first
        @players[1..-1].each do |player|
            if player.hand.rank_hand < winner.hand.rank_hand 
                winner = player
            elsif player.hand.rank_hand == winner.hand.rank_hand
                winner = player if player.hand.rank_card(player.hand.best_hand[1])< winner.hand.rank_card(winner.hand.best_hand[1])
            end
        end
        winner.add_to_pot(@pot)
        print "The winner is #{winner} with #{winner.hand.best_hand[0]} " 
        winner.hand.show_hand
        sleep(5)
        @pot = 0

        return
    end

    def play_game
        until game_over?
            play_round
        end
    end
end

game = Game.new
game.play_game