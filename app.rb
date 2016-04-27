require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'bundler/setup'
require 'rack-flash'
require 'paperclip'
require './models'

set :database, "sqlite3:joketown.sqlite3"
set :sessions, true

enable :sessions
use Rack::Flash, :sweep => true

get '/' do
	# current_user
	# @users = User.all
	erb :index
end

get '/welcome' do
	erb :welcome
end

get '/landing' do
	erb :landing
end

get '/profile' do
	erb :profile
end

post '/sign_up' do
	user = User.create(params[:signup])
	redirect "/welcome"
end

post '/sign-in' do
	@user = User.where(username: params[:login][:username]).first
	if @user && @user.password == params[:login][:password]
		session[:user_id] = @user.id
		flash[:notice] = "You've been signed in successfully."
		redirect "/landing"
	else
		flash[:alert] = "There was a problem signing you in."
	end
	redirect "/"
end