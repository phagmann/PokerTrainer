class Compare
    require 'pp'
    $suits = ["♠", "♥", "♦", "♣"]
    $ranks = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    def self.high_card(cards)
        highest = -1
        highest_face = ""
        cards.each do |card|
            current = $ranks.each_index.select{|i| $ranks[i] === card.rank}[0]
            if  current > highest
                highest = current
                highest_face = card.rank
            end
        end
        return highest_face # highest (index)
    end

    def self.two_pair?(cards)
        total = {}
        cards.each do |card|
            if total.keys.include?(card.rank) then total[card.rank] += 1 else  total[card.rank] = 1  end
        end
        total.keys.each do |kard|
            return [true,kard] if total[kard] >= 2
        end
        return [false,"0"]
    end

    def self.three_pair?(cards)
        total = {}
        cards.each do |card|
            if total.keys.include?(card.rank) then total[card.rank] += 1 else  total[card.rank] = 1  end
        end
        total.keys.each do |kard|
            return [true,kard] if total[kard] >= 3
        end
        return [false,"0"]
    end

    def self.three_pair?(cards)
        total = {}
        cards.each do |card|
            if total.keys.include?(card.rank) then total[card.rank] += 1 else  total[card.rank] = 1  end
        end
        total.keys.each do |kard|
            return [true,kard] if total[kard] >= 4
        end
        return [false,"0"]
    end

    def self.flush?(cards)
        total = {}
        cards.each do |card|
            if total.keys.include?(card.suit) then total[card.suit] += 1 else  total[card.suit] = 1  end
        end
        total.keys.each do |kard|
            
            if total[kard] >= 5
                total_cards = []
                cards.each do |card|
                    total_cards += [card] if card.suit === kard
                end
                return [true,Compare.high_card(total_cards)] 
            end
        end
        return [false,"0"]
    end

    #TODO: straight, twopair, fullhouse, straightflush


end
