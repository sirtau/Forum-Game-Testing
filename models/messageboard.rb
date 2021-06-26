def new_thread( owner_id, post_time, post_title, post_content )
    run_sql( "INSERT INTO messageboard(owner_id,post_date, post_title, post_content, visible) VALUES('#{owner_id}','#{post_time}','#{post_title}','#{post_content}', TRUE);" )
    run_sql( "UPDATE messageboard SET parent_id = post_id WHERE parent_id is null;" )
end

def new_comment( parent_id, owner_id, post_time, post_content )
    run_sql( "INSERT INTO messageboard(parent_id,owner_id,post_date,post_content,visible) VALUES(#{parent_id},'#{owner_id}','#{post_time}','#{post_content}', TRUE);" )
end

def update_post( post_id, post_title, post_content )
    run_sql("UPDATE messageboard SET post_title = '#{post_title}', post_content = '#{post_content}' WHERE post_id = #{post_id};")
end

def update_comment( post_id,post_content )
    run_sql("UPDATE messageboard SET post_content = '#{post_content}' WHERE post_id = #{post_id};")
end

def list_active_posts()
    sql_query = ("SELECT username, post_date, post_title, post_content FROM messageboard INNER JOIN users ON users.id=messageboard.owner_id WHERE visible = TRUE;")
    results = run_sql(sql_query)
    if results.to_a.length > 0
        return results
    else
        return nil
    end 
end


def list_active_threads()
    sql_query = ("SELECT * FROM messageboard INNER JOIN users ON users.id=messageboard.owner_id  WHERE NULLIF(post_title, 'NULL') IS NOT NULL;")
    results = run_sql(sql_query)
    if results.to_a.length > 0
        return results
    else
        return nil
    end 
end

def get_post( id )

    sql_query = ("SELECT * FROM messageboard WHERE post_id = #{id}")
    results = run_sql( sql_query )
    if results.to_a.length > 0
        return results[0]
    else
        return "no_post_found_with_id: #{id}"
    end 
end

def get_thread( parent_id )

    sql_query = ("SELECT parent_id, username, post_title, post_content, post_date FROM messageboard INNER JOIN users ON users.id=messageboard.owner_id WHERE parent_id = #{ parent_id } ORDER BY post_id")
    
    results = run_sql( sql_query )
    if results.to_a.length > 0
        return results
    else
        return "no_post_found"
    end 
end

def display_date( date_array, username )
suffix = ""
    if date_array[0][1] == "1" && date_array[0] != "11"
        suffix = "st"
        p date_array[0] + suffix
    elsif date_array[0][1] == "2" && date_array[0] != "12"
        suffix = "nd"
        p date_array[0] + suffix
    elsif date_array[0][1] == "3" && date_array[0] != "13"
        suffix = "rd"
        p date_array[0] + suffix
    else
        suffix = "th"
        p date_array[0] + suffix
    end

    
    return [username, "at #{date_array[3]} on #{date_array[4]} the #{date_array[0] + suffix} of #{date_array[5]}, #{date_array[2]}"]

end

def delete_comment( post_id )
    sql_query = ("DELETE FROM messageboard WHERE post_id = #{ post_id }")
    puts sql_query
        results = run_sql( sql_query )
        return results
end

def delete_thread( parent_id )
    sql_query = ("DELETE FROM messageboard WHERE parent_id = #{ parent_id }")
    puts sql_query
        results = run_sql( sql_query )
        return results
end

