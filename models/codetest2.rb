def random_fight
    
    fight_active = true
 
    player = ScaledEntity.new("Player 1", 7)
    enemy = ScaledEntity.new("Slime", 5)
    
    
    while fight_active
        swing_strength = rand(0..player.strength)
        damage = swing_strength*2 - enemy.defence/2
        p "Swing Strength: #{swing_strength}, Damage: #{damage}"
        if damage < 0
            damage = 0
        end
        p "#{enemy.name} took #{damage} points of damage. #{enemy.currenthp} down to #{(enemy.currenthp - damage)}"
        enemy.currenthp = enemy.currenthp - damage
        p enemy.currenth

        enemy_swing_strength = rand(0..enemy.strength)
        enemy_damage = enemy_swing_strength*2 - player.defence/2
        p "Swing Strength: #{enemy_swing_strength}, Damage: #{enemy_damage}"
        if enemy_damage < 0
            enemy_damage = 0
        end
        p "#{player.name} took #{enemy_damage} points of damage. #{player.currenthp} down to #{(player.currenthp - enemy_damage)}"
        player.currenthp = player.currenthp - enemy_damage
        p player.currenth

        if player.health < 1
            puts "You died!"
            fight_active = false
        elsif
            enemy.health < 1
            puts "You defeated the dangerous #{enemy.name}"
            fight_active = false
        end
    end


end
binding.irb