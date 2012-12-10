# This code is for the multicoloured LED

require 'sinatra'
require 'bundler/setup'
require 'wiringpi'

require File.expand_path('../lib/led.rb', __FILE__)

get '/' do
  @title = "Home"
  erb :home
end

get '/set_colour/:colour' do
  Led.colour(params[:colour])
end

get '/cycle' do
  Led.cycle
  redirect_to :home
end

get '/blink' do
  colour = params[:colour]
  interval = params[:interval]
  Led.blink(colour, interval)
end

get '/setup' do
  @title = "Setup"
  erb :setup
end