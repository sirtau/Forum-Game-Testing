get '/town' do
    if session[:character_hash]
    character_hash = session[:character_hash]
    erb :'/game/game', locals: { character_hash: character_hash }
    else redirect '/'
end
