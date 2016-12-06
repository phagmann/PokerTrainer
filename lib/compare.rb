require 'pp'
class Compare 
    $suits = ["♠", "♥", "♦", "♣"]
    $ranks = ["0","2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    $hashy = {}
    (0..($ranks.length - 1) ).each do |ind|
        $hashy[$ranks[ind]] = ind
    end
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

    def self.pair?(cards)
        total = {}
        cards.each do |card|
            if total.keys.include?(card.rank) then total[card.rank] += 1 else  total[card.rank] = 1  end
        end
        $ranks[1..-1].reverse.each do |kard|
            next if !total.keys.include?(kard)
            return [true,kard] if total[kard] >= 2
        end
        return [false,"0"]
    end

    def self.three_pair?(cards)
        total = {}
        cards.each do |card|
            if total.keys.include?(card.rank) then total[card.rank] += 1 else  total[card.rank] = 1  end
        end
        $ranks[1..-1].reverse.each do |kard|
            next if !total.keys.include?(kard)
            return [true,kard] if total[kard] >= 3
        end
        return [false,"0"]
    end

    def self.four_pair?(cards)
        total = {}
        cards.each do |card|
            if total.keys.include?(card.rank) then total[card.rank] += 1 else  total[card.rank] = 1  end
        end
        $ranks[1..-1].reverse.each do |kard|
            next if !total.keys.include?(kard)
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

    def self.two_pair?(cards)
        # fix string ranking
        total = {}
        cards.each do |card|
            if total.keys.include?(card.rank) then total[card.rank] += 1 else  total[card.rank] = 1  end
        end
        $ranks[1..-1].reverse.each do |kard|
            next if !total.keys.include?(kard) 
            if total[kard] >= 2
                total.delete(kard)
                $ranks[1..-1].reverse.each do |kard2|
                   next if !total.keys.include?(kard2) 
                   return [true,kard] if total[kard2] >= 2
                end

                break
            end
        end
        return [false,"0"]
    end


    def self.full_house?(cards)
        total = {}
        cards.each do |card|
            if total.keys.include?(card.rank) then total[card.rank] += 1 else  total[card.rank] = 1  end
        end
        $ranks[1..-1].reverse.each do |kard|
            next if !total.keys.include?(kard)
            if total[kard] >= 3
                total.delete(kard)
                $ranks[1..-1].reverse.each do |kard2|
                   next if !total.keys.include?(kard2)
                   return [true,kard] if total[kard2] >= 2
                end

                break
            end
        end
        return [false,"0"]
    end

    def self.straight?(cards)
        total = {}
        head = "0"
        num_in_arow = 0
        cards.each do |card|
            if total.keys.include?(card.rank) then total[card.rank] += 1 else  total[card.rank] = 1  end
        end
        previous_kard = "0"
        $ranks[1..-1].reverse.each do |kard|
            next if !total.keys.include?(kard)
            if num_in_arow === 0
                head = kard
                previous_kard = kard
                num_in_arow += 1
                next
            end
            if $hashy[kard].to_i === $hashy[previous_kard].to_i - 1 || (kard === "2" && total.keys.include?("A"))
                num_in_arow += 1
                previous_kard = kard
            else
                num_in_arow = 1
                head = kard
                previous_kard = kard
            end

            return [true, head] if num_in_arow === 5




        end
        return [false, "0"]

    end

    def self.straight_flush?(cards)

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
                return Compare.straight?(total_cards) 
            end
        end
        return [false,"0"]


    end
        
    
    #TODO: figure out who wins, and how to tell who wins if two multi people have same rank of hand
    # return [player.id "hand they have", ...]
    def self.win_order(players, array_of_cards)
        order = {}
        result ={}
        count_order = 0-1
        array_of_cards.each do |cards|
            count_order += 1
            curr = Compare.straight_flush?(cards)
            if curr[0] == true
                order[players[count_order].email] = 900 + $hashy[curr[1]]
                result[players[count_order].email] = "straight flush #{curr[1]} high"
                next
            end

            curr = Compare.four_pair?(cards)
            if curr[0] == true
                order[players[count_order].email] = 800 + $hashy[curr[1]]
                result[players[count_order].email] = "four #{curr[1]}s"
                next
            end

            curr = Compare.full_house?(cards)
            if curr[0] == true
                order[players[count_order].email] = 700 + $hashy[curr[1]]
                result[players[count_order].email] = "full_house #{curr[1]}s"
                next
            end

            curr = Compare.flush?(cards)
            if curr[0] == true
                order[players[count_order].email] = 600 + $hashy[curr[1]]
                result[players[count_order].email] = "flush #{curr[1]} high"
                next
            end

            curr = Compare.straight?(cards)
            if curr[0] == true
                order[players[count_order].email] = 500 + $hashy[curr[1]]
                result[players[count_order].email] = "straight #{curr[1]} high"
                next
            end

            curr = Compare.three_pair?(cards)
            if curr[0] == true
                order[players[count_order].email] = 400 + $hashy[curr[1]]
                result[players[count_order].email] = "three #{curr[1]}s"
                next
            end
            
            curr = Compare.two_pair?(cards)
            if curr[0] == true
                order[players[count_order].email] = 300 + $hashy[curr[1]]
                result[players[count_order].email] = "two pair #{curr[1]} high"
                next
            end
            curr = Compare.pair?(cards)
            if curr[0] == true
                order[players[count_order].email] = 200 + $hashy[curr[1]]
                result[players[count_order].email] = "pair of #{curr[1]}s"
                next
            end
            order[players[count_order].email] = 100 + $hashy[Compare.high_card(cards)]
            result[players[count_order].email] = "#{Compare.high_card(cards)} high"
            # long run, resolve complicated ties





        end
        final_order = []
        order = Hash[order.sort_by{|k, v| v}.reverse]
        set = []
        previous_email = ""
        order.keys.each do |email|
            if previous_email != ""
                if order[email] != order[previous_email]
                  final_order << set
                  set = []
                end
            end
            set << "#{email}: #{result[email]}"
            previous_email = email

        end
        final_order << set
        set = []
        return final_order
    
    end

    def self.scrap_email(string)
        email=""
        string.each_char do |char|
            if char != ":" then email += char else return email end
        end
    end

    


end
