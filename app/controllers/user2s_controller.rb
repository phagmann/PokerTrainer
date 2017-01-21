class User2sController < ApplicationController
    # show list of players
    def show
        player_list = []
        g = Game.find(params[:id])
        player_list << Player.find(g.player1_id) if g.player1_id != nil
        player_list << Player.find(g.player2_id) if g.player2_id != nil
        player_list << Player.find(g.player3_id) if g.player3_id != nil
        player_list << Player.find(g.player4_id) if g.player4_id != nil
        render json: player_list
    end

end
