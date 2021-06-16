get '/signup' do

    erb :'/users/signup' 

end

get '/users' do
char_list = list_characters_by_id( session[:user_id] )
p char_list
textbox = "test"
    erb :'/menu', locals: { char_list: char_list, textbox: textbox }

end


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

get '/select_character/:id' do |id|


    character_array_get = get_current_character( id )

    if character_array_get["owner_id"] == session[:user_id]
        session[:character_array] = character_array_get
    else
        session[:character_array] = "invalid"
    end
    

       redirect '/'
end


