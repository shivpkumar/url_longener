get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:short_url' do
  @url = Url.find_by_short_url(params[:short_url])
  redirect "#{@url.full_url}"
end

post '/create' do
  @url = Url.create(params[:url])
  erb :url_details
end
