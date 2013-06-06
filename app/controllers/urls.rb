get '/' do
  @urls = Url.all.reverse!
  erb :index
end

get '/:long_url_hash' do
  @url = Url.find_by_long_url_hash(params[:long_url_hash])
  @url.click_count += 1
  @url.save
  redirect "#{@url.original_url}"
end

post '/your_custom_really_really_long_url' do
  @url = Url.create(params[:url])
  if @url.valid?
    erb :url_details
  else
    @errors = @url.errors.full_messages
    erb :errors
  end
end