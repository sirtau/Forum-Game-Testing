def get_player
    return run_sql( "SELECT * FROM users WHERE id = 1;" )
end

def random_fight
    
    fight_active = true
 
    player = ScaledEntity.new("Player 1", 7)
    enemy = ScaledEntity.new("Slime", 8)
    
    
    while fight_active
        swing_strength = rand(0..player.strength)
        damage = swing_strength*2 - enemy.defence/2

        if damage < 0
            damage = 0
        end
        p "Swing Strength: #{swing_strength}, Damage: #{damage}"
        p "#{player.name} hit #{enemy.name} for #{damage} points of damage."
        p "#{enemy.name} has #{(enemy.currenthp - damage)} HP left."
        enemy.currenthp = enemy.currenthp - damage
        p enemy.currenthp

        if enemy.currenthp < 1
            puts "You defeated the dangerous #{enemy.name}"
            fight_active = false
            break
        end

        enemy_swing_strength = rand(0..enemy.strength)
        enemy_damage = enemy_swing_strength*2 - player.defence/2

        if enemy_damage < 0
            enemy_damage = 0
        end
        p "Swing Strength: #{enemy_swing_strength}, Damage: #{enemy_damage}"
        p "#{enemy.name} hit #{player.name} for #{enemy_damage} points of damage."
        p "#{player.name} has #{(player.currenthp - enemy_damage)} HP left."
        player.currenthp = player.currenthp - enemy_damage
        p player.currenthp

        if player.currenthp < 1
            puts "You died!"
            fight_active = false
        end


    end


end