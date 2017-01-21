class Game < ActiveRecord::Base
    has_many :hands
    belongs_to :player
    has_one :pot 
    has_many :rivers
    
    # get this working in view
    def deal_cards
        deck = Card.all.shuffle
        # byebug
        Hand.create(game_id: self.id, player_id: self.player3_id, card_id: deck.pop.id, positions_id: "3")
        Hand.create(game_id: self.id, player_id: self.player3_id, card_id: deck.pop.id, positions_id: "6")
        

        Hand.create(game_id: self.id, player_id: self.player1_id, card_id: deck.pop.id, positions_id: "1")
        Hand.create(game_id: self.id, player_id: self.player1_id, card_id: deck.pop.id, positions_id: "4")



        Hand.create(game_id: self.id, player_id: self.player2_id, card_id: deck.pop.id, positions_id: "2")
        Hand.create(game_id: self.id, player_id: self.player2_id, card_id: deck.pop.id, positions_id: "5")

        r = River.create(game_id: self.id, card_id: deck.pop.id)
        self.river1_id = r.card_id
        r = River.create(game_id: self.id, card_id: deck.pop.id)
        self.river2_id = r.card_id
        r = River.create(game_id: self.id, card_id: deck.pop.id)
        self.river3_id = r.card_id
        r = River.create(game_id: self.id, card_id: deck.pop.id)
        self.river4_id = r.card_id
        r = River.create(game_id: self.id, card_id: deck.pop.id)
        self.river5_id = r.card_id
        self.save
        # byebug

    end

 

end
