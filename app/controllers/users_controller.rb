class UsersController < ApplicationController
    def show
        render json: Player.find(params[:id])
    end

    def update
        @player = Player.find(params[:id])
        @player.update_attributes(player_params)
        @player.save
        render json: @player
    end

    private

    def player_params
      params.require(:player).permit(:chips_bank, :betting)
    end

end
