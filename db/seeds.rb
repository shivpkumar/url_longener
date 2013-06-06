require 'faker'

15.times do |user|
  user_params = {}

  user_params[:first_name] = Faker::Name.first_name
  user_params[:last_name] = Faker::Name.last_name
  user_params[:email] = Faker::Internet.email
  user_params[:password] = Faker::Lorem.word

  User.create(user_params)

end

150.times do |url|
  url_params = {}

  url_params[:original_url] = Faker::Internet.url
  url_params[:user_id] = (1..15).to_a.sample

  Url.create(url_params)
end
