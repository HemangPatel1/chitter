require 'bcrypt'
require 'data_mapper'

class User

	include DataMapper::Resource

	has n, :peeps, :through => Resource

	property :id, Serial
	property :name, String
	property :username, String, :unique => true, :message => "The username you entered is already being used!"
	property :email, String, :unique => true, :message => "The email you entered is already being used!"
	property :password_digest, Text

	attr_reader :password
  attr_accessor :password_confirmation

	validates_confirmation_of :password, :message => "Sorry, your passwords don't match!"

	def password=(password)
	  @password = password
	  self.password_digest = BCrypt::Password.create(password)
	end

  def self.authenticate(email, password)
		user = first(:email => email)
		if user && BCrypt::Password.new(user.password_digest) == password
			user
		else
			nil
		end
	end



end
