class HandsController < ApplicationController
    def show
        render json: Hand.find(params[:id])
    end
end
