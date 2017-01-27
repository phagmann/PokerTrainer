class CompsController < ApplicationController
    def show
        # alot of this can be in model!!
        final = Hash.new
        ai_player_list = []
        g = Game.find(params[:id])
        # just AI players
        ai_player_list << Player.find(g.player1_id) if g.player1_id != nil
        ai_player_list << Player.find(g.player2_id) if g.player2_id != nil
        
        # very simple AI strat
        ai_player_list.each do |player|
            num = 1 + rand(100)
            final[player.id] = "Fold" if num <= 1
            final[player.id] = "Check" if num > 1 && num <= 99
        end

        keys = final.keys()
     
        ai_player_list.each do |player|
            action = final[player.id]
            player_hands = player.hands.where(game_id: g.id)

            if action == "Check" 
                player.betting += g.current_high_bet
                player.chips_bank -= g.current_high_bet
                player.save
            elsif action == "Fold"
                player_hands.each do |hand|
                    hand.fold = true
                    hand.save
                end
            end

        end
        g.current_high_bet = 0
        g.save
        render json: ai_player_list

    end


end
