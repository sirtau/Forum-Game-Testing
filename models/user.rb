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
        return nil
    end 
end


def is_logged_in? ( usersession )
    if session[:user_id]

        
    end
end