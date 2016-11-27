require './lib/compare.rb'
class GamesController < ApplicationController
  def index
        @deck = generate_deck.shuffle
        @card1 = Card.new
        firstcard = @deck.pop[0]
        @card1.suit = firstcard[0]
        @card1.rank = firstcard[1..-1]
        

        @deck = @deck.shuffle
        @card2 = Card.new
        secondcard = @deck.pop[0]
        @card2.suit = secondcard[0]
        @card2.rank = secondcard[1..-1]

        @deck = @deck.shuffle
        @opp_c1 = Card.new
        opp1card = @deck.pop[0]
        @opp_c1.suit = opp1card[0]
        @opp_c1.rank = opp1card[1..-1]
        

        @deck = @deck.shuffle
        @opp_c2 = Card.new
        opp2card = @deck.pop[0]
        @opp_c2.suit = opp2card[0]
        @opp_c2.rank = opp2card[1..-1]

        @deck = @deck.shuffle
        @opp_c3 = Card.new
        opp3card = @deck.pop[0]
        @opp_c3.suit = opp3card[0]
        @opp_c3.rank = opp3card[1..-1]


        @deck = @deck.shuffle
        @opp_c4 = Card.new
        opp4card = @deck.pop[0]
        @opp_c4.suit = opp4card[0]
        @opp_c4.rank = opp4card[1..-1]





        @deck = @deck.shuffle
        @river1 = Card.new
        river1card = @deck.pop[0]
        @river1.suit = river1card[0]
        @river1.rank = river1card[1..-1]

        @deck = @deck.shuffle
        @river2 = Card.new
        river2card = @deck.pop[0]
        @river2.suit = river2card[0]
        @river2.rank = river2card[1..-1]

        @deck = @deck.shuffle
        @river3 = Card.new
        river3card = @deck.pop[0]
        @river3.suit = river3card[0]
        @river3.rank = river3card[1..-1]

        @deck = @deck.shuffle
        @flip1 = Card.new
        flip1card = @deck.pop[0]
        @flip1.suit = flip1card[0]
        @flip1.rank = flip1card[1..-1]

        @deck = @deck.shuffle
        @flip2 = Card.new
        flip2card = @deck.pop[0]
        @flip2.suit = flip2card[0]
        @flip2.rank = flip2card[1..-1]

  end

  def new


  end

  private 

  def generate_deck
        decks = []
        suits = ["♠", "♥", "♦", "♣"]
        ranks = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
        suits.each do |suit|
            ranks.each do |rank|
                decks << [suit + rank]
            end
        end
        return decks

    end
end
