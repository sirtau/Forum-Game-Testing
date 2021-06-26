

get '/town' do
    check_char_selected()
    character_hash = session[:character_hash]


    erb :'/game/game', locals: { character_hash: character_hash }
end


get '/gametest' do
    check_logged_in()


    erb :'/game/gametesting'
end


