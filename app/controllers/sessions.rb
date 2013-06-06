enable :sessions

post '/sign_up' do
  @new_user = User.create(params[:user])
  @user = @new_user if @new_user.id
  session['user'] = @user.id if @user
  if @user
    redirect '/'
  else
    @errors = @new_user.errors.full_messages
    erb :errors
  end
end

post '/log_in' do
  @user = User.authenticate(params[:user])
  if @user
    session["user"] = @user.id
    redirect "/"
  else
    redirect :errors
  end
end

get '/log_in' do
  erb :log_in
end

get '/logout' do
  session["user"] = nil
  redirect "/"
end

get '/sign_up' do
  erb :sign_up
end
