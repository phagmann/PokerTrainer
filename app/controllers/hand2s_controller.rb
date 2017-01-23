class Hand2sController < ApplicationController
    def show
        master_hands = []
        player_list = []
        g = Game.find(params[:id])
        player_list << Player.find(g.player1_id) if g.player1_id != nil
        player_list << Player.find(g.player2_id) if g.player2_id != nil
        player_list << Player.find(g.player3_id) if g.player3_id != nil
        player_list << Player.find(g.player4_id) if g.player4_id != nil
        player_list.each do |player|
            master_hands += player.hands.where(game_id: g.id)
        end
      render json: master_hands

    end

    private

    def hand_params
      params.require(:hand).permit(:fold, :positions_id)
    end
end
