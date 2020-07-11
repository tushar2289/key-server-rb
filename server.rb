require 'sinatra'
require "sinatra/reloader"
require 'json'


class Index < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello, Welcome to API Key generator!'
  end

  get '/generate-key' do
    'Generates a key'
  end
end