require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'net/http'
require 'uri'

configure do
  set :views,         File.dirname(__FILE__) + '/views'
  set :public_folder, File.dirname(__FILE__) + '/public'
end

get '/' do
  @host = ENV['CF_INSTANCE_IP'] || '192.168.0.0'
  @port = ENV['CF_INSTANCE_PORT'] || '9292'
  @index = ENV['CF_INSTANCE_INDEX'] || '0'
  @agent = request.user_agent


  uri = URI.parse(ENV['EIP_ENDPOINT'])


  http = Net::HTTP.new(uri.host, uri.port)
  header = { 'Content-Type' => 'text/plain' }
  net_request = Net::HTTP::Post.new(uri.request_uri, header)
  net_request.body = @agent

  @response_body = http.request(net_request).body

  # redirect "#{@response_body}"

  erb :index
end
