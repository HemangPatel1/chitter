require 'bcrypt'
require 'data_mapper'

class User

	include DataMapper::Resource

	property :id, Serial
	property :name, String
	property :email, String, :unique => true, :message => "The email you entered is already being used!"
	property :password_digest, Text

	attr_reader :password
  attr_accessor :password_confirmation

	validates_confirmation_of :password, :message => "Sorry, your passwords don't match!"

	def password=(password)
	  @password = password
	  self.password_digest = BCrypt::Password.create(password)
	end



end
