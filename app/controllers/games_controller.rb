require './lib/compare.rb'
class GamesController < ApplicationController
  def index
  

        pp Compare.high_card([@card1,@card2])
        pp Compare.two_pair?([@card1,@card2,@river1,@river2,@river3])
        pp Compare.flush?([@card1,@card2,@river1,@river2,@river3,@flip1,@flip2])
  end

  def new


  end


end
