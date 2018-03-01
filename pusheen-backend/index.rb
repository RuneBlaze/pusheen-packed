require 'sinatra'
require 'data_mapper'

require "sinatra/json"
require 'sinatra/cross_origin'

set :bind, '0.0.0.0'

  configure do
    enable :cross_origin
  end

  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

DataMapper::Logger.new($stdout, :debug)

options "*" do
    response.headers["Allow"] = "GET, POST, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end

  # An in-memory Sqlite3 connection:
  DataMapper.setup(:default, 'sqlite::memory:')


class User
  include DataMapper::Resource

  property :id,         Serial
  property :first, String
  property :last, String
  property :address, String
  property :city, String
  property :state, String
  property :zip, String
  property :email, String
  property :phone, String
end

DataMapper.auto_migrate!

SYMS = %w{id first last address city state zip email phone}

before  '/user'  do
  request.body.rewind
  @request_payload = JSON.parse request.body.read
end

post '/user' do
    SYMS.each do |s|
        sym = s.to_sym
    end
    user = User.new(@request_payload)
    user.save
end

require 'json'

get '/all' do
    res = User.all().map do |it|
        {id: it.id, first: it.first, last: it.last, address: it.address}
    end
    json res
end