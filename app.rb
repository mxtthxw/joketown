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