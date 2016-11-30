class Game < ActiveRecord::Base
    # get this working in view
    def deal_cards(player)
        deck = Card.all.shuffle
        # byebug
        Hand.create(game_id: self.id, player_id: player.id, card_id: deck.pop.id)
        Hand.create(game_id: self.id, player_id: player.id, card_id: deck.pop.id)
        

        cp1 = Player.find_by_email("p1@comp.com")
        Hand.create(game_id: self.id, player_id: cp1.id, card_id: deck.pop.id)
        Hand.create(game_id: self.id, player_id: cp1.id, card_id: deck.pop.id)



        cp2 = Player.find_by_email("p2@comp.com")
        Hand.create(game_id: self.id, player_id: cp2.id, card_id: deck.pop.id)
        Hand.create(game_id: self.id, player_id: cp2.id, card_id: deck.pop.id)

        River.create(game_id: self.id, card_id: deck.pop.id)
        River.create(game_id: self.id, card_id: deck.pop.id)
        River.create(game_id: self.id, card_id: deck.pop.id)
        River.create(game_id: self.id, card_id: deck.pop.id)
        River.create(game_id: self.id, card_id: deck.pop.id)
        # byebug

    end

 

end
