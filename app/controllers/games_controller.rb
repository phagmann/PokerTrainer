require './lib/compare.rb'
class GamesController < ApplicationController
  # GENIUS IDEA, use NCG varibles, each for probability of each hand to assign weights
  def index
    @games = Game.all
    if current_player
     current_player.all_chips += current_player.chips_bank
     current_player.chips_bank = 0
     current_player.save
    end
  end

  def create
    @game = Game.create(player1_id: 1, player2_id: 2, player3_id: current_player.id )
    player_list = []
    player_list << Player.find(@game.player1_id) if @game.player1_id != nil
    player_list << Player.find(@game.player2_id) if @game.player2_id != nil
    player_list << Player.find(@game.player3_id) if @game.player3_id != nil
    player_list << Player.find(@game.player4_id) if @game.player4_id != nil

    player_list.each do |player|
      player.betting = 0
      player.chips_bank = 500 # if player has zero chips then should redirct to page to buy more chips!
      player.all_chips -= player.chips_bank
      player.save
    end

    @game.deal_cards
    Pot.create(game_id: @game.id)
    redirect_to (game_path(@game.id))
  end

  def show

    @game = Game.find(params[:id])





    human1 =  Hand.where( game_id: @game.id, player_id: current_player.id ).order(card_id: :asc)
    @card1 = Card.find_by( id: human1[0].card_id )
    @card2 = Card.find_by( id: human1[1].card_id )

    comp1 = Hand.where( game_id: @game.id, player_id: 1 ).order(card_id: :asc)
    @opp_c1 = Card.find_by( id: comp1[0].card_id )
    @opp_c2 = Card.find_by( id: comp1[1].card_id )


    comp2 = Hand.where( game_id: @game.id, player_id: 2 ).order(card_id: :asc)
    @opp_c3 = Card.find_by( id: comp2[0].card_id )
    @opp_c4 = Card.find_by( id: comp2[1].card_id )

    river = @game.rivers
    @river1 = Card.find_by(id: river[0].card_id)
    @river2 = Card.find_by(id: river[1].card_id)
    @river3 = Card.find_by(id: river[2].card_id)
    @flip1 = Card.find_by(id: river[3].card_id)
    @flip2 = Card.find_by(id: river[4].card_id)
    # load = Card.find([23,8,9,7,24])
    # pp load
    # pp Compare.straight?(load)
    shared_cards = Card.where(id: river.pluck("card_id"))

    load3 = Card.where(id: human1.pluck("card_id")) + shared_cards
    load2 = Card.where(id: comp2.pluck("card_id")) + shared_cards
    load1 = Card.where(id: comp1.pluck("card_id")) + shared_cards


    @score = Compare.win_order([Player.find_by(id: comp1.first.player_id), Player.find_by(id: comp2.first.player_id), Player.find_by(id: human1.first.player_id)] ,[load1,load2,load3])


# <% track_place = 0 %>
# <% rank_score = ["First", "Second", "Third"] %>
# <% @score.each do |set| %>
#   <% set.each do |n| %>
#       <h3 ><%=  "#{rank_score[track_place]}: #{n}" %></h3>
#   <% end %>
#    <% track_place += 1%>
# <% end %>

    # pp Compare.high_card(load)
    # pp "==========================================="
    # pp Compare.pair?(load)
    # pp "==========================================="
    # pp Compare.straight?(load)
    # pp "==========================================="
    # pp Compare.full_house?(load)
    # pp "==========================================="
    # pp Compare.straight_flush?(load)
    # pp "==========================================="

    @hh1 = [Hand.find_by(game_id: @game.id, player_id: Player.find_by(email: Compare.flat_array(@score)[0]))]
    @hh1 += [Hand.find_by(game_id: @game.id, player_id: Player.find_by(email: Compare.flat_array(@score)[1]))]
    @hh1 += [Hand.find_by(game_id: @game.id, player_id: Player.find_by(email: Compare.flat_array(@score)[2]))]

    respond_to do |format|
      format.html { 
        @game.current_high_bet = 0
        @game.pot.total_chips = 0
        @game.pot.save 
        @game.save 
        player_list = []
        player_list << Player.find(@game.player1_id) if @game.player1_id != nil
        player_list << Player.find(@game.player2_id) if @game.player2_id != nil
        player_list << Player.find(@game.player3_id) if @game.player3_id != nil
        player_list << Player.find(@game.player4_id) if @game.player4_id != nil

        player_list.each do |player|
          player.betting = 0
          player.save
        end



      }
      format.json { render json: @hh1  }
    end

  end

  def update
    @game = Game.find(params[:id])
    Hand.destroy_all( game_id: @game.id)
    River.destroy_all(game_id: @game.id)

    @game.deal_cards
    redirect_to(game_path)
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy 
    @game.pot.destroy
    Hand.destroy_all( game_id: @game.id)
    River.destroy_all(game_id: @game.id)
    redirect_to(games_path)
  end

 private 

  def hand_params
    params.require(:hand).permit(:fold)
  end

  def player_params
    params.require(:player).permit(:chips_bank, :betting, :all_chips)
  end

  def game_params
    params.require(:game).permit(:current_high_bet)
  end

  def card_value_conversion_hash 
    hashy = {}
    ranks = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    (0..(ranks.length - 1) ).each do |ind|
        hashy[ranks[ind]] = ind
    end
    return hashy
  end

end
