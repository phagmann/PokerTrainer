class PotsController < ApplicationController
    def show
        render json: Pot.find_by(game_id: params[:id])
    end

    def update
        pot = Pot.find_by(game_id: params[:id])
        pot.update_attributes(pot_params)
        pot.save
        render json: pot
    end

    private

    def pot_params
      params.require(:pot).permit(:total_chips)
    end
end
