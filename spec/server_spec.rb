require_relative '../server'  # <-- your sinatra app
require 'rspec'
require 'rack/test'

RSpec.describe 'Server app' do
  include Rack::Test::Methods

  def app
    Index
  end

  it "says hello" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Hello, Welcome to API Key generator!')
  end

  it "generates a key" do
    get "/generate-key"
    expect(last_response).to be_ok
  end

  it "fetch an available key" do
    get "/get-available-key"
    expect(last_response).to be_ok
  end

  it "unblock a key" do
    get "/unblock-key/tushar"
    expect(last_response.status).to eq(404)
  end
end