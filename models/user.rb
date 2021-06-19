def create_user( username, email, password )
    password_digest = BCrypt::Password.create(password)

    run_sql( "INSERT INTO users(username,email,password_digest) VALUES('#{username}','#{email}','#{password_digest}');" )
end

def all_users 
    return run_sql( "SELECT * FROM users;" )
end


def find_user_by_username ( user )
    sql_query = ("SELECT * FROM users WHERE username = '#{user}'")
    results = run_sql( sql_query )
    if results.to_a.length > 0
        return results[0]
    else
        return nil
    end 
end

# SELECT username, char_name FROM users INNER JOIN characters ON characters.owner_id=users.id;

def find_user_by_id ( id )
    sql_query = ("SELECT * FROM users WHERE id = #{id}")
    results = run_sql( sql_query )
    if results.to_a.length > 0
        return results[0]
    else
        return "no_user_found_with_id: #{id}"
    end 
end

def list_characters_by_id ( owner_id )
    sql_query = ("SELECT * FROM characters WHERE owner_id = #{owner_id};")
    results = run_sql( sql_query )
    if results.to_a.length > 0
        return results
    else
        return nil
    end 
end

def is_logged_in? ( )
    if session[:user_id]
        return true
    else
        return false
               
    end
end


def character_selected? ( )
    if session[:char_id]
        return true
    else
        return false   
    end
end


def get_current_character ( char_id )
    if session[:char_id] == "invalid"
        return "Invalid Character Selected"
    else
        sql_query = ("SELECT * FROM characters WHERE char_id = #{char_id}")
        results = run_sql( sql_query )
        if results.to_a.length > 0
            return results[0]
        else
            return "no_user_found_with_id: #{id}"
        end 
    end

end

def check_character_id_owner ( )

    if character_hash[:owner_id] == session[:user_id]
        return true
    else
        return false
    end
end


