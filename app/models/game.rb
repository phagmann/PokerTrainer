class Game < ActiveRecord::Base
    has_many :hands
    belongs_to :player
    has_one :pot 
    has_many :rivers
    
    # get this working in view
    def deal_cards(player)
        deck = Card.all.shuffle
        # byebug
        Hand.create(game_id: self.id, player_id: player.id, card_id: deck.pop.id, positions_id: "3")
        Hand.create(game_id: self.id, player_id: player.id, card_id: deck.pop.id, positions_id: "6")
        

        cp1 = Player.find_by_email("p1@comp.com")
        Hand.create(game_id: self.id, player_id: cp1.id, card_id: deck.pop.id, positions_id: "1")
        Hand.create(game_id: self.id, player_id: cp1.id, card_id: deck.pop.id, positions_id: "4")



        cp2 = Player.find_by_email("p2@comp.com")
        Hand.create(game_id: self.id, player_id: cp2.id, card_id: deck.pop.id, positions_id: "2")
        Hand.create(game_id: self.id, player_id: cp2.id, card_id: deck.pop.id, positions_id: "5")

        River.create(game_id: self.id, card_id: deck.pop.id)
        River.create(game_id: self.id, card_id: deck.pop.id)
        River.create(game_id: self.id, card_id: deck.pop.id)
        River.create(game_id: self.id, card_id: deck.pop.id)
        River.create(game_id: self.id, card_id: deck.pop.id)
        # byebug

    end

 

end
