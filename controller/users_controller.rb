get '/signup' do
    username = params[:username]
    email = params[:email]
    password = params[:password]
    name = params[:name]

    erb :food, locals: { username: username, email: email, password: password, name: name }

    erb :'/users/signup' 

end

get '/users' do
    username = params[:username]
    email = params[:email]


    results = all_users()


    erb :'/users', locals: { results: results, username: username, email: email }

end

post '/users' do
    username = params[:username]
    email = params[:email]
    password = params[:password]


    create_user( username, email, password )
    results = all_users()


    erb :'/users', locals: { results: results, username: username, email: email, password: password }

end

