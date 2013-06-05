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
  @url = Url.find_by_original_url(params[:url][:original_url])
  @url = Url.create(params[:url]) unless @url
  erb :url_details
end
