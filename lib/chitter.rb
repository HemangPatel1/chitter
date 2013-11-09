require 'sinatra/base'
require 'data_mapper'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/user'

DataMapper.finalize
DataMapper.auto_upgrade!


class Chitter < Sinatra::Base
	set :views, File.join(File.dirname(__FILE__), '..', 'views')

	enable :sessions
	set :session_secret, 'super secret'

	helpers do
		def current_user
			@current_user ||=User.get(session[:user_id]) if session[:user_id]
		end
	end


	get '/' do
    erb :index
  end

	get '/users/new' do
		erb :"users/new"
	end

	post '/users' do
		user = User.create(:email => params[:email],
 											 :password => params[:password],
 											 :name => params[:name])
		session[:user_id] = user.id
		redirect to('/')
	end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
