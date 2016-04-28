require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'bundler/setup'
require 'rack-flash'
require 'paperclip'
require './models'

enable :sessions
use Rack::Flash, :sweep => true

configure(:development){set :database, "sqlite3:joketown.sqlite3"}
# configure(:production){set :database, ""}
set :sessions, true


def current_user
	if session[:user_id]
		@current_user = User.find(session[:user_id])
	end
end

get '/' do
	# current_user
	# @users = User.all
	erb :index
end

get '/welcome' do
	current_user
	erb :welcome
end

get '/landing' do
	current_user
	erb :landing
end

get '/profile' do
	current_user
	puts params.inspect
	puts @current_user
	erb :profile
end

post '/sign_up' do
	@user = User.create(params[:signup])
	redirect "/welcome"
end

post '/newprofile' do
	# puts params.inspect
	@user = User.find(session[:user_id])
	@user.firstname = params[:profile][:firstname]
	@user.lastname = params[:profile][:lastname]
	@user.age = params[:profile][:age]
	@user.birthday = params[:profile][:birthday]
	@user.username = params[:profile][:username]
	# conditional to check if username is unique
	redirect '/profile'
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