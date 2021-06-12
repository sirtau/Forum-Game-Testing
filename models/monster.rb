class ScaledEntity
    def initialize( name, level )
        @name = name
        @level = level
        @max_health = level
        @current_health = level*6
        @max_mana = level
        @current_mana = level
        @strength = level
        @stamina = level
        @defence = level
    end

    def name
        return @name
    end

    def maxhp
        return @max_health
    end

    def currenthp
        return @current_health
    end

    def currenthp= currenthp
        @current_health = currenthp
    end

    def maxmp
        return @max_mana
    end

    def currentmp
        return @current_mana
    end

    def strength
        return @strength
    end

    def stamina
        return @stamina
    end

    def defence
        return @defence
    end

    def level
        return @level
    end

end