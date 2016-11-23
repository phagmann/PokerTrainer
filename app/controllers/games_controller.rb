class GamesController < ApplicationController
  def index
  end

  def new

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
