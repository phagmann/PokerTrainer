class Ai
    def self.plan
        num = 1 + rand(100)
        return "Fold" if num <= 10
        return "Call" if num > 10 && num <= 90
        return "Raise" if num > 90
    end
    

end