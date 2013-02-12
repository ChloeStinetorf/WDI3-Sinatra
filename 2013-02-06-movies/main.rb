require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'HTTParty'
require 'json'
require 'pg'


get '/' do
  erb :home
end

get '/movies' do
  sql = 'select poster from movies;'

  conn = PG.connect(:dbname =>'movie_app', :host => 'localhost')
  @rows = conn.exec(sql)
  conn.close
  erb :posters
end

get '/about' do
  erb :about
end

get '/faq' do
  erb :faq
end

get '/home' do

  @movie = params[:movie]
  if @movie != nil
    @movie = @movie.gsub(' ', '+')

    movie_string = HTTParty.get('http://www.omdbapi.com/?t=' + @movie).body
    @movie_hash = JSON(movie_string)

    sql = "INSERT INTO movies (title, poster, year, rated) VALUES ('#{@movie_hash['Title']}', '#{@movie_hash['Poster']}', '#{@movie_hash['Year']}', '#{@movie_hash['Rated']}');"
    conn = PG.connect(:dbname =>'movie_app', :host => 'localhost')
    conn.exec(sql)
    conn.close

  end
  erb :home
end











