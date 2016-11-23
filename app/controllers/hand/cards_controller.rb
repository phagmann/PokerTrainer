class Hand::CardsController < ApplicationController
    def new
    end




    private

    def card_params
      params.require(:card).permit(:rank, :suit)
    end

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
