class CompsController < ApplicationController
    def show
        # TODO: make real cycle work. only move on if all bets are equal and everyone has moved once
        # alot of this can be in model!!
        final = Hash.new
        ai_player_list = []
        current_player.moved_once = true
        current_player.save
        g = Game.find(params[:id])
        g.save
        # just AI players
        ai_player_list << Player.find(g.player1_id) if g.player1_id != nil
        ai_player_list << Player.find(g.player2_id) if g.player2_id != nil
        
        # very simple AI strat
        ai_player_list.each do |player|
            num = 1 + rand(100)
            final[player.id] = "Fold" if num <= 1
            final[player.id] = "Check" if num > 1 && num <= 80
            final[player.id] = "Raise" if num > 80
        end

        keys = final.keys()
     
        ai_player_list.each do |player|
            action = final[player.id]
            player_hands = player.hands.where(game_id: g.id)

            if action == "Check" 
                prev_bet = player.betting
                player.betting = g.current_high_bet
                player.chips_bank -= (g.current_high_bet - prev_bet) 
                player.moved_once = true
                
            elsif action == "Fold"
                player_hands.each do |hand|
                    hand.fold = true
                    hand.save
                    player.moved_once = true
                    
                end
            elsif action == "Raise"
                bett = 7
                prev_bet = player.betting
                g.current_high_bet += bett
                g.save
                player.betting = g.current_high_bet
                player.chips_bank -= (g.current_high_bet - prev_bet)
                player.moved_once = true
                
            player.save
            end
        
        end

        ai_player_list << Player.find(g.player3_id) if g.player3_id != nil
        ai_player_list << Player.find(g.player4_id) if g.player4_id != nil
        g.current_high_bet = 0 if match?(ai_player_list, g.current_high_bet)
        g.save

        p "*********",ai_player_list
        render json: ai_player_list

    end

    private

    def match?(players, high_bet)
        players.each do |player|
            return false if player.betting != high_bet
        end
        return true
    end

    def hand_params
      params.require(:hand).permit(:fold)
    end

    def player_params
      params.require(:player).permit(:chips_bank, :betting, :all_chips, :moved_once)
    end

    def game_params
      params.require(:game).permit(:current_high_bet)
    end

end
