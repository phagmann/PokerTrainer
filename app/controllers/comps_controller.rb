class CompsController < ApplicationController
    def show
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
        render json: final
    end


end
