require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require './lib/user'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

DataMapper.finalize


class Chitter < Sinatra::Base
	set :views, File.join(File.dirname(__FILE__), '..', 'views')

	enable :sessions
	set :session_secret, 'only a jedi will keep the secret'
	use Rack::Flash

	helpers do
		def current_user
			@current_user ||=User.get(session[:user_id]) if session[:user_id]
		end
	end


	get '/' do
    erb :index
  end

	get '/users/new' do
		@user = User.new
		erb :"users/new"
	end

	post '/users' do
		@user = User.create(:email => params[:email],
 											 :password => params[:password],
											 :password_confirmation => params[:password_confirmation],
 											 :name => params[:name])
		if @user.save
			session[:user_id] = @user.id
			redirect to('/')
		else
			flash.now[:errors] = @user.errors.full_messages
			erb :"users/new"
		end
	end

	get '/sessions/new' do
		erb :"sessions/new"
	end

	post '/sessions' do
		email, password = params[:email], params[:password]
  		user = User.authenticate(email, password)
	  if user
			session[:user_id] = user.id
			redirect to('/')
	  else
	    flash[:errors] = ["The email or password are incorrect"]
	    erb :"sessions/new"
	  end
	end

	delete '/sessions' do
		flash[:notice] = "Good bye!"
	  	session[:user_id] = nil
	  	session.clear
	  	redirect to('/')
	end

	post '/clear' do
	  flash[:notice] = "Good bye!"
	  session.clear
	  redirect '/'
	end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
