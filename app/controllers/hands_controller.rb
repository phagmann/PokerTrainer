class HandsController < ApplicationController
    def show
        render json: Hand.find(params[:id])
    end

    def update
        hand = Hand.find(params[:id])
        hand.update_attributes(hand_params)
        hand.save
        render json: hand
    end

    private

    def hand_params
      params.require(:hand).permit(:fold, :positions_id)
    end

end

    