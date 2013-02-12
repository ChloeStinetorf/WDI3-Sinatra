require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

get '/' do
  erb :home
end

get '/new_friend' do
  erb :new_friend
end

post '/create' do
    name = params[:name]
    age = params[:age]
    gender = params[:gender]
    image = params[:image]
    twitter = params[:twitter]
    github = params[:github]

    sql = "INSERT INTO friends (name, age, gender, image, twitter, github) VALUES ('#{name}', '#{age}', '#{gender}', '#{image}', '#{twitter}', '#{github}');"
    conn = PG.connect(:dbname =>'friends', :host => 'localhost')
    conn.exec(sql)
    conn.close

    redirect to('/friends')
  end

  get '/friends' do
    sql = 'SELECT * FROM friends;'
    conn = PG.connect(:dbname =>'friends', :host => 'localhost')
    @rows = conn.exec(sql)
    conn.close
    erb :friends
  end
