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
        
        @card1.save
        @card2.save

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
