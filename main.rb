require 'sinatra'
require 'httparty'
require 'bcrypt'
require 'pg'
enable :sessions
require_relative 'db/db'
require_relative 'models/user'
require_relative 'models/monster'
require_relative 'models/fight'
require_relative 'controller/users_controller'
require_relative 'controller/shop_controller'
# require_relative 'controller/fight_controller'
require_relative 'controller/monster_controller'
require_relative 'controller/sessions_controller'



get '/' do
    username = params[:username]
    email = params[:email]


    results = all_users()


    erb :'/users', locals: { results: results, username: username, email: email }

end