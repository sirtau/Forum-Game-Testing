get '/sessions/login' do
    erb :'/sessions/login', locals: { error_message: ''}


erb :'/sessions/login'
end


post '/signup' do
    username = params[:username]
    email = params[:email]
    password = params[:password]

    create_user( username, email, password )

redirect '/'
end



get '/posttest' do

    erb :'/game/posttest'
end

post '/posttest' do
    username = params[:username]
    email = params[:email]
    password = params[:password]

    create_user( username, email, password )

redirect '/'
end

get '/logout' do
    session.clear

    redirect '/'
end

