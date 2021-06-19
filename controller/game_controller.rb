get '/create' do

    erb :'/game/create' 

end


post '/create' do
    char_name = params[:char_name]
    owner_id = session[:id]


    create_character( owner_id, char_name )

redirect '/'
end
