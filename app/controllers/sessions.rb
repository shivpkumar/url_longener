enable :sessions

post '/new_user' do
  @new_user = User.create(params[:user])
  @user = @new_user if @new_user.id
  session['user'] = @user.id if @user
  if @user
    redirect :party_page
  else
    redirect '/'
  end
end

post '/login_user' do
  @user = User.authenticate(params[:user])
  if @user
    session["user"] = @user.id
    redirect :party_page
  else
    redirect :unparty_page
  end
end

get '/login' do
  erb :login
end

get '/logout' do
  session["user"] = nil
  redirect "/"
end