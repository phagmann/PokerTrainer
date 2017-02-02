class CompsController < ApplicationController
    def show
        # TODO: make real cycle work. only move on if all bets are equal and everyone has moved once
        # alot of this can be in model!!
        final = Hash.new
        ai_player_list = []
        g = Game.find(params[:id])
        
        current_player.moved_once = true
        g.current_high_bet = current_player.betting if current_player.betting > g.current_high_bet
        g.save
        current_player.save
        
        # just AI players
        ai_player_list << Player.find(g.player1_id) if g.player1_id != nil && Hand.find_by(game_id: g.id, player_id: g.player1_id).fold == false
        ai_player_list << Player.find(g.player2_id) if g.player2_id != nil && Hand.find_by(game_id: g.id, player_id: g.player2_id).fold == false
        
        # very simple AI strat
        ai_player_list.each do |player|
            num = 1 + rand(100)
            final[player.id] = "Fold" if num <= 10
            final[player.id] = "Check" if num > 10 && num <= 75
            final[player.id] = "Raise" if num > 75
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
        pot = Pot.find_by(game_id: params[:id])
        ai_player_list << Player.find(g.player3_id) if g.player3_id != nil
        ai_player_list << Player.find(g.player4_id) if g.player4_id != nil
        if match?(ai_player_list, g.current_high_bet) == true
            ai_player_list.each do |player|
                pot.total_chips += player.betting
                player.betting = 0
                player.save
            end
            g.current_high_bet = 0 
        end
        g.save
        pot.save







        
        render json: ai_player_list

    end

    private

    def match?(players, high_bet)
        players.each do |player|
            return false if player.betting != high_bet && Hand.find_by(player_id: player.id).fold == false
        end
        return true
    end

    def pot_params
      params.require(:pot).permit(:total_chips)
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
