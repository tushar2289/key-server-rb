require_relative '../server'  # <-- your sinatra app
require 'rspec'
require 'rack/test'

RSpec.describe 'Server app' do
  include Rack::Test::Methods
  key_generated = nil

  def app
    Index
  end

  it "says hello" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Hello, Welcome to API Key generator!')
  end

  it "should generate a key" do
    get "/generate-key"
    key_generated = JSON.parse(last_response.body)["id"]
    expect(last_response).to be_ok
    expect(key_generated.length).to eq(36)
  end

  it "should fetch an available key" do
    get "/get-available-key"
    expect(last_response.status).to eq(200)
  end

  it "should return 404 when no keys are available" do
    get "/get-available-key"
    expect(last_response.status).to eq(404)
  end

  it "should unblock key provided" do
    get "/unblock-key/#{key_generated}"
    expect(last_response.status).to eq(200)
  end

  it "should return 404 when tried to unblock and key not found" do
    get "/unblock-key/tushar"
    expect(last_response.status).to eq(404)
  end

  it "should keep alive key provided" do
    get "/keep-alive/#{key_generated}"
    expect(last_response.status).to eq(200)
  end

  it "should return 404 when tried to keep alive and key not found" do
    get "/keep-alive/tushar"
    expect(last_response.status).to eq(404)
  end

  it "should delete key provided" do
    get "/delete-key/#{key_generated}"
    expect(last_response.status).to eq(200)
  end

  it "should return 404 when tried to delete and key not found" do
    get "/delete/tushar"
    expect(last_response.status).to eq(404)
  end
end