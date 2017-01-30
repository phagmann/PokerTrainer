class PotsController < ApplicationController
    def show
        render json: Pot.find_by(game_id: params[:id])
    end
    # update (pot) should: update the correct pot and update all bettings to zero
    def update
        pot = Pot.find_by(game_id: params[:id])

        player_list = []
        g = Game.find(pot.game_id)
        player_list << Player.find(g.player1_id) if g.player1_id != nil
        player_list << Player.find(g.player2_id) if g.player2_id != nil
        player_list << Player.find(g.player3_id) if g.player3_id != nil
        player_list << Player.find(g.player4_id) if g.player4_id != nil
        p match?(player_list, g.current_high_bet), "$$$$$$$", player_list
        if match?(player_list, g.current_high_bet) == true
            player_list.each do |player|
                pot.total_chips += player.betting
                player.betting = 0
                player.save
            end
        end
        pot.update_attributes(pot_params)
        pot.save
        render json: pot
    end

    private

     def match?(players, high_bet)
        players.each do |player|
            return false if player.betting != high_bet
        end
        return true
     end

    def pot_params
      params.require(:pot).permit(:total_chips)
    end
end
