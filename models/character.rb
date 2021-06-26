def create_character( owner_id, char_name )

    run_sql( "INSERT INTO characters(owner_id,char_name,gamestate,char_level,xp_points,max_health,current_health,max_mana,current_mana,strength,stamina,defence,gold,inventory ) VALUES(#{owner_id},'#{char_name}','new',1,0,25,25,15,15,10,10,10,0,'e');" )
end

def delete_character( post_id )
    sql_query = ("DELETE FROM characters WHERE char_id = #{ char_id }")
    puts sql_query
        results = run_sql( sql_query )
        return results
end