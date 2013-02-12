require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'YahooFinance'
require 'active_support/all'

get '/stock' do
  symbol = params[:symbol]
  if !symbol.nil?
    @symbol = symbol.upcase
    @quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade.round(2)
  end
  erb :stock

end