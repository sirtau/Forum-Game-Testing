post '/users' do

    username = params[:username]
    password = params[:password]
    user = find_user_by_username( username )
    bcrypt_password = BCrypt::Password.new(user['password_digest'])

    if bcrypt_password == password
        session[:user_id] = user['id']
        puts "User logged in"
        redirect '/'
    else
        puts "Incorrect Password"
        erb :'/sessions/login', locals: {error_message: 'Incorrect Password' }
    end

    redirect '/'

end


