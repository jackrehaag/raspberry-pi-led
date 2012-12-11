# This code is for the multicoloured LED

require 'sinatra'
require 'bundler/setup'
require 'wiringpi'
require 'twilio-ruby'

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

get '/text_input' do
  if @sms.content.include?('red')
    Led.colour("red")
    twiml = Twilio::TwiML::Response.new do |r|
      twiml.Sms = "The colour has been set to red"
    end
  elsif @sms.content.include?('yellow')
    Led.colour("yellow")
    twiml = Twilio::TwiML::Response.new do |r|
      twiml.Sms = "The colour has been set to yellow"
    end
  elsif @sms.content.include?('green')
    Led.colour("green")
    twiml = Twilio::TwiML::Response.new do |r|
      twiml.Sms = "The colour has been set to green"
    end
  else
    twiml = Twilio::TwiML::Response.new do |r|
      twiml.Sms = "Sorry but you have not provided a correct colour, please choose from 'red', 'green' or 'yellow' "
    end
  end
  twiml.text
end