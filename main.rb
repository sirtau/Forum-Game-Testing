require 'sinatra'
require 'httparty'
require 'bcrypt'
require 'pg'
require 'pp'
enable :sessions
require_relative 'db/db'
require_relative 'models/user'
require_relative 'models/monster'
require_relative 'models/fight'
require_relative 'models/character'
require_relative 'models/messageboard'
require_relative 'controller/users_controller'
require_relative 'controller/town_controller'
require_relative 'controller/game_controller'
require_relative 'controller/monster_controller'
require_relative 'controller/sessions_controller'
require_relative 'controller/board_controller'



get '/' do
    username = params[:username]
    email = params[:email]
    user_id = session[:user_id]
    textbox = params[:textbox]
    character_hash = session[:character_hash]
    if is_logged_in?( )

        char_list = list_characters_by_id( user_id )
      
    end


 


    p "is logged in?"
    p is_logged_in?( )
    p "session data"
    p session
    p session[:user_id]
    p "-----"



    


    erb :'/menu', locals: { username: username, email: email, char_list: char_list, textbox: textbox, character_hash: character_hash }

end