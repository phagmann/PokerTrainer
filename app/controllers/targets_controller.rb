class TargetsController < ApplicationController

    def show
      render json: Game.find(params[:id])
    end

    def update
      g = Game.find(params[:id])
      g.update_attributes(game_params)
      g.save
      render json: g
    end

    private

    def game_params
      params.require(:game).permit(:current_high_bet)
    end
end
