get '/' do
  @urls = Url.all
  erb :index
end

get '/:long_url_hash' do
  @url = Url.find_by_long_url_hash(params[:long_url_hash])
  redirect "#{@url.original_url}"
end

post '/your_custom_really_really_long_url' do
  @url = Url.create(params[:url])
  erb :url_details
end
