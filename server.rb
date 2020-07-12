require 'sinatra'
require "sinatra/reloader"
require "sinatra/json"
require 'json'
require_relative 'lib/classes/KeyBase'
require_relative 'lib/modules/Constants'


class Index < Sinatra::Base
  include Constants

  configure :development do
    register Sinatra::Reloader
  end

  @@keyBase = KeyBase.new

  def self.keyBase
    @@keyBase
  end 

  get '/' do
    'Hello, Welcome to API Key generator!'
  end

  get '/generate-key' do
    key = @@keyBase.generateKey
    json "id" => key.id
  end

  get '/get-available-key' do
    key = @@keyBase.getAvailableKey
    if key == ERROR_KEY_NOT_FOUND
      status 404
      body json "message" => ERROR_KEY_NOT_FOUND
    else
      json "id" => key.id
    end
  end

  get '/unblock-key/:id' do
    msg = @@keyBase.unblockKey(params["id"])
    if msg == ERROR_KEY_NOT_FOUND
      status 404
      body json "message" => msg
    else
      json "message" => msg
    end
  end

  get '/keep-alive/:id' do
    msg = @@keyBase.keepAlive(params["id"])
    if msg == ERROR_KEY_NOT_FOUND
      status 404
      body json "message" => msg
    else
      json "message" => msg
    end
  end

  get '/delete-key/:id' do
    msg = @@keyBase.deleteKey(params["id"])
    if msg == ERROR_KEY_NOT_FOUND
      status 404
      body json "message" => msg
    else
      json "message" => msg
    end
  end
end