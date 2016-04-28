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
	# @user = User.find(session[:user_id])
	# current_user
	erb :welcome
end

get '/landing' do
	# @user = User.find(session[:user_id])
	# current_user
	erb :landing
end

get '/profile' do
	@user = User.find(session[:user_id])
	puts params.inspect
	puts @user.firstname
	puts @user.inspect
	puts User.find(26).inspect
	# current_user
	erb :profile
end

get '/newpost' do
	erb :newpost
end

get '/posts/:id' do
	@post = Post.find(params[:id])
	erb :show_post
end

post '/sign_up' do
	@user = User.create(params[:signup])
	# conditionals to check if username and email are unique
	session[:user_id] = @user.id
	redirect "/welcome"
end

post '/newprofile' do
	# puts params.inspect
	@user = current_user
	@user.update(firstname: params[:firstname], lastname: params[:lastname], age: params[:age], birthday: params[:birthday])
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

post '/posts/create' do
	@post = Post.create(params[:post])
	redirect "/posts/#{post.id}"
end

