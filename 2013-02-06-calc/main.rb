require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/calc' do
  @first = params[:first].to_f
  @second = params[:second].to_f

  @result = case params[:operator]
  when '+' then @first + @second
  when '-' then @first - @second
  when '*' then @first * @second
  when '/' then @first / @second
  end
  erb :calc
end


# get '/calc/multiply/:x/:y' do
#   @result = params[:x].to_f * params[:y].to_f
#   erb :calc
# end

#  get '/calc/add/:x/:y' do
#   @result = params[:x].to_f + params[:y].to_f
#   erb :calc
# end

# get '/calc/subtract/:x/:y' do
#   @result = params[:x].to_f - params[:y].to_f
#   erb :calc
# end

# get '/calc/divide/:x/:y' do
#   @result = params[:x].to_f / params[:y].to_f
#   erb :calc
# end





# get '/hello' do
#   'i am a master hacker ninja!'
# end

# get '/' do
#   'this is the home page'
# end

# get '/chloestinetorf' do
#   'Hello, Chloe Stinetorf!'
# end

# get '/name/:first/:last/:age' do
#   "your name is -> #{params[:first]} #{params[:last]} and your age is #{params[:age]}"
# end

# get '/:first_num/:second_num' do
#   result = params[:first_num].to_i * params[:second_num].to_i
#   "#{result}"
# end

