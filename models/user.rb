def create_user( username, email, password )
    password_digest = BCrypt::Password.create(password)

    run_sql( "INSERT INTO users(username,email,password_digest, gamestate, level, xp_points, inventory) VALUES('#{username}','#{email}','#{password_digest}','new', 1, 0, 'e');" )
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



def find_user_by_id ( id )
    sql_query = ("SELECT * FROM users WHERE id = #{id}")
    results = run_sql( sql_query )
    if results.to_a.length > 0
        return results[0]
    else
        return nil
    end 
end


def is_logged_in? ( usersssion )
    if session[:user_id]

        
    end
end