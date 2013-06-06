get '/user/:id' do
  user_id = params[:id]
  @user = User.find(user_id)
  @urls = Url.where("user_id = ?", user_id).reverse
  erb :profile
end