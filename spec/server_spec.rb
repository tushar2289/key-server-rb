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
end