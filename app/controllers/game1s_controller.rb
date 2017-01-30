class Game1sController < ApplicationController
    def show 
        render json: Game.find(params[:id])
    end
end
