get '/board' do
    if !session[:user_id]
        redirect '/'
    end

posts = list_active_threads()



# posts.each do |post|
#     puts "doing it"
#     p post
#     puts post["post_date"]
# end



    erb :'/messageboard/board', locals: { posts: posts }

end


post '/newthread' do

    if !session[:user_id]

        redirect '/'
    end

    time = Time.new
post_time = time.strftime('%d/%m/%Y/%k:%M/%A/%B')
    post_title = params[:post_title]
    post_content = params[:post_content]
    owner_id = session[:user_id]
new_thread(owner_id, post_time, post_title, post_content)

    redirect '/board'

end



get '/editpost/:id' do |id|
    if !session[:user_id]
        redirect '/'
    end

    post = get_post( id )
  
    if !post["owner_id"] == session[:user_id]
        redirect '/board'
    end
     puts "LOADING"
     comment = false
    erb :'/messageboard/edit', locals: {post: post, comment: comment}
end

put '/update/:id' do |id|
    if !session[:user_id]
        redirect '/'
    end
    post_title = params[:post_title]
    post_content = params[:post_content]
    post_id = id
    update_post(post_id, post_title, post_content)

    redirect '/board'

end

put '/updatecomment/:id' do |id|
    if !session[:user_id]
        redirect '/'
    end
        post_content = params[:post_content]
    post_id = id
    update_comment(post_id,post_content)

    redirect '/board'

end

#testing
# ["26", "06", "2021", "17:45", "Saturday", "June"]

# date_array = ["11", "06", "2021", "17:45", "Saturday", "June"]
# display_date(date_array)

get '/thread/:id' do |id|
    if !session[:user_id]
        redirect '/'
    end

    thread = get_thread( id )
    puts thread
    erb :'/messageboard/thread', locals: {thread: thread}
end

post '/comment/:id' do |id|
    if !session[:user_id]

        redirect '/'
    end

    time = Time.new
    post_time = time.strftime('%d/%m/%Y/%k:%M/%A/%B')
    parent_id = id
    post_content = params[:post_content]
    owner_id = session[:user_id]
    new_comment(parent_id, owner_id, post_time, post_content)

    redirect '/thread/'+ id

end

get '/deletecomment/:parent_id/:post_id' do |parent_id, post_id|

    delete_comment( post_id )
    redirect '/thread/'+ parent_id
end

get '/deletethread/:parent_id' do |parent_id|

    delete_thread( parent_id )
    redirect '/board/'
end

get '/editcomment/:parent_id/:post_id' do |parent_id, post_id|
    if !session[:user_id]
        redirect '/'
    end

    post = get_post( post_id )
  
    if !post["owner_id"] == session[:user_id]
        redirect '/board'
    end
     puts "LOADING"
    comment = true
    erb :'/messageboard/edit', locals: {post: post, comment: comment}
end