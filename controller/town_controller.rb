get '/town' do
    character_hash = session[:character_hash]


    erb :'/game/game', locals: { character_hash: character_hash }
end


get '/gametest' do



    erb :'/game/gametesting'
end


